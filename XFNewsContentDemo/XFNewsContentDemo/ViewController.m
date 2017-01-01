//
//  ViewController.m
//  XFNewsContentDemo
//
//  Created by 徐亚非 on 16/8/19.
//  Copyright © 2016年 maxthon. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "XFNewsContentModel.h"
#import "XFCorrelationNewsJSExport.h"

#define NilToEmptyString(str)  ((IsEmptyString((str))) ? @"" : (str))
#define IsEmptyString(s)  (((s) == nil) || ([(s) stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0))

@interface ViewController () <UIWebViewDelegate, XFWebViewExportDelegate>

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) JSContext *jsContext;
@property (nonatomic, strong) XFNewsContentModel *data;
@property (nonatomic, strong) NSArray<XFNewsListModel *> *correlationData;
@property (nonatomic, strong) XFCorrelationNewsJSExport *jsExport;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _data = [XFNewsContentModel new];
    _correlationData = @[[XFNewsListModel new], [XFNewsListModel new], [XFNewsListModel new]];
    
    _webView = [[UIWebView alloc] initWithFrame:CGRectZero];
    _webView.delegate = self;
    [self.view addSubview:_webView];
    
    NSURL *templateURL = [[NSBundle mainBundle] URLForResource:@"XFNewsContent" withExtension:@"html"];
    [_webView loadRequest:[NSURLRequest requestWithURL:templateURL]];
    //[_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://wappass.baidu.com/passport"]]];
    
    _jsExport = [XFCorrelationNewsJSExport new];
    _jsExport.delegate = self;
    
    UISwitch *switchButton = [[UISwitch alloc] initWithFrame:CGRectZero];
    [switchButton addTarget:self action:@selector(switchMode:) forControlEvents:UIControlEventValueChanged];
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithCustomView:switchButton];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"Middle" style:UIBarButtonItemStylePlain target:self action:@selector(switchFontSize:)];
    item2.tag = 1;
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithTitle:@"Content" style:UIBarButtonItemStylePlain target:self action:@selector(switchContent:)];
    item3.tag = 1;
    self.navigationItem.rightBarButtonItems = @[item1, item2, item3];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _webView.frame = self.view.bounds;
}

#pragma mark - XFWebViewExportDelegate

- (void)onClick:(NSInteger)index {
    [self.navigationController pushViewController:[ViewController new] animated:YES];
}

- (void)onload {
    [self webViewDidFinishLoadcompletely];
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)documentReadyStateComplete {
    [self webViewDidFinishLoadcompletely];
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)webViewDidFinishLoadcompletely {
    [self displayContent];
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView {
    _jsContext = [_webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    _jsContext[@"xfNewsContext"] = _jsExport;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    if (!webView.isLoading) {
        NSString *readyState = [webView stringByEvaluatingJavaScriptFromString:@"document.readyState"];
        BOOL complete = [readyState isEqualToString:@"complete"];
        if (complete) {
            [self webViewDidFinishLoadcompletely];
        } else {
            NSString *jsString =
            @"window.onload = function() {"
            @"    xfNewsContext.onload();"
            @"};"
            @"document.onreadystatechange = function () {"
            @"    if (document.readyState == \"complete\") {"
            @"        xfNewsContext.documentReadyStateComplete();"
            @"    }"
            @"};";
            [_webView stringByEvaluatingJavaScriptFromString:jsString];
        }
        NSLog(@"%@", NSStringFromSelector(_cmd));
    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(nonnull NSError *)error {
    [self displayError];
}

#pragma mark - JavaScript

- (void)displayContent {
    if (!_data.content) {
        [self displayError];
        return;
    }
    
    NSString *htmlContent = _data.content;
    NSMutableString *jsCode = [NSMutableString stringWithFormat:@"addData(\"title\",\"%@\");"
                               @"addData(\"content\",\"%@\");"
                               @"addData(\"source\",\"%@\");"
                               @"addData(\"time\",\"%@\");",
                               [self escapeString:_data.title],
                               [self escapeString:htmlContent],
                               [self escapeString:_data.source],
                               [self escapeString:_data.createdAt]];
    
    for (int i = 0; i < _correlationData.count; i++) {
        if (i == 0) {
            [jsCode appendFormat:@"showCorrelationHeader(\"%@\");", NSLocalizedString(@"相关新闻", nil)];
        }
        
        XFNewsListModel *model = _correlationData[i];
        NSDictionary *dic = @{@"title":model.title,
                              @"img":model.image,
                              @"author":model.source,
                              @"date":model.displayTime};
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
        NSString *paramString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        
        [jsCode appendFormat:@"addCorrelationData(%@, %lu, %d);", paramString, (unsigned long)_correlationData.count, i];
    }
    
    [_webView stringByEvaluatingJavaScriptFromString:jsCode];
}

- (void)displayLoading {
    NSString *jsCode = [NSString stringWithFormat:@"showLoading(\"%@\");", NSLocalizedString(@"加载中…", nil)];
    [_webView stringByEvaluatingJavaScriptFromString:jsCode];
}

- (void)displayError {
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"Error" ofType:@"png"];
    NSURL *url = [NSURL fileURLWithPath:imagePath];
    NSString *jsCode = [NSString stringWithFormat:@"showError(\"%@\");",[url absoluteString]];
    [_webView stringByEvaluatingJavaScriptFromString:jsCode];
}

- (NSString *)escapeString:(NSString *)str {
    if (IsEmptyString(str) || ![str isKindOfClass:[NSString class]]) {
        return [NSString string];
    }
    NSString *jsString = str;
    jsString = [jsString stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    jsString = [jsString stringByReplacingOccurrencesOfString:@"\r" withString:@"\\\r"];
    jsString = [jsString stringByReplacingOccurrencesOfString:@"\n" withString:@"\\\n"];
    return jsString;
}

#pragma mark - Action

- (void)switchMode:(UISwitch *)switchButton {
    NSString *jsCode = [NSString string];
    if (switchButton.isOn) {
        NSDictionary *dictionary = @{@"backgroundColor":@"#202125",
                                     @"titleColor":@"#AEB5C5",
                                     @"infoColor":@"#4E5057",
                                     @"contentColor":@"#AEB5C5",
                                     @"bannerColor":@"#343539"};
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:nil];
        NSString *paramString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        jsCode = [NSString stringWithFormat:@"xfApplyThemeMode(%@);", paramString];
    } else {
        jsCode = @"xfRemoveThemeMode();";
    }
    [self.webView stringByEvaluatingJavaScriptFromString:jsCode];
}

- (void)switchFontSize:(UIBarButtonItem *)itemButton {
    if (++ itemButton.tag >= 3) {
        itemButton.tag = 0;
    }
    NSString *jsCode = [NSString string];
    switch (itemButton.tag) {
        case 0: {
            itemButton.title = @"Small";
            jsCode = @"xfSetFontSize('small');";
            break;
        } case 1: {
            itemButton.title = @"Middle";
            jsCode = @"xfSetFontSize('');";
            break;
        } case 2: {
            itemButton.title = @"Big";
            jsCode = @"xfSetFontSize('big');";
            break;
        } default: {
            break;
        }
    }
    [self.webView stringByEvaluatingJavaScriptFromString:jsCode];
}

- (void)switchContent:(UIBarButtonItem *)itemButton {
    if (++ itemButton.tag >= 3) {
        itemButton.tag = 0;
    }
    switch (itemButton.tag) {
        case 0: {
            itemButton.title = @"Loading";
            [self displayLoading];
            break;
        } case 1: {
            itemButton.title = @"Content";
            [self displayContent];
            break;
        } case 2: {
            itemButton.title = @"Error";
            [self displayError];
            break;
        } default: {
            break;
        }
    }
}

@end
