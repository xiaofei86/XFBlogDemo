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

#define NilToEmptyString(str)  ((isEmptyString((str))) ? @"" : (str))
#define isEmptyString(s)  (((s) == nil) || ([(s) stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0))

@interface ViewController () <UIWebViewDelegate>

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
    
    NSURL *templateURL = [[NSBundle mainBundle] URLForResource:@"XFNewsContent" withExtension:@"html"];
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [_webView loadRequest:[NSURLRequest requestWithURL:templateURL]];
    _webView.delegate = self;
    [self.view addSubview:_webView];
    
    _jsExport = [XFCorrelationNewsJSExport new];
    _jsExport.viewController = self;
    
    UISwitch *switchButton = [[UISwitch alloc] initWithFrame:CGRectZero];
    [switchButton addTarget:self action:@selector(switchMode:) forControlEvents:UIControlEventValueChanged];
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithCustomView:switchButton];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"Middle" style:UIBarButtonItemStylePlain target:self action:@selector(switchFontSize:)];
    item2.tag = 1;
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithTitle:@"Content" style:UIBarButtonItemStylePlain target:self action:@selector(switchContent:)];
    item3.tag = 1;
    self.navigationItem.rightBarButtonItems = @[item1, item2, item3];
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    if (!_jsContext) {
        _jsContext =  [_webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
        _jsContext[@"xfNewsContext"] = _jsExport;
    }
    if (!webView.isLoading) {
        [self displayContent];
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
        
        [jsCode appendFormat:@"addCorrelationData(%@, %d);", paramString, i];
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
    if (isEmptyString(str) || ![str isKindOfClass:[NSString class]]) {
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
        jsCode = @"xfNightModeTool.applyNightMode();";
    } else {
        jsCode = @"xfNightModeTool.removeNightMode();";
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
