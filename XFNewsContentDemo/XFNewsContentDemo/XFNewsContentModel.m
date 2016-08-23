//
//  XFNewsContentModel.m
//  XFNewsContentDemo
//
//  Created by 徐亚非 on 16/8/19.
//  Copyright © 2016 www.maxthon.com. All rights reserved.
//

#import "XFNewsContentModel.h"
#import "XFHTMLConfigurator.h"

@implementation XFNewsContentModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.title = @"只有三星才能撑起Android大旗 不让iPhone一家独大";
        self.sourceURL = @"http://tech.china.com/news/prnasia/11082256/20160822/23344579.html";
        self.source = @"中华网";
        self.createdAt = @"2016-08-21 23:40:03";
        
        XFContentFragmentModel *paragrap1 = [XFContentFragmentModel new];
        paragrap1.type = XFContentFragmentTypeText;
        paragrap1.value = @"【腾讯科技编者按】《福布斯》网站撰稿人伊万·斯彭斯(Ewan Spence)日前发文指出，虽然Android手机在数量上大幅领先于iPhone，但从所占利润份额等其他数据来看，iPhone阵营处于明显的领先地位。作者认为，只有三星电子才能撑起Android平台大旗，以免让iPhone在高端智能手机领域出现一家独大的局面。以下为文章概要。";
        
        XFContentFragmentModel *paragrap2 = [XFContentFragmentModel new];
        paragrap2.type = XFContentFragmentTypeText;
        paragrap2.value = @"有时候事情的真相隐藏在数据之后。在智能手机世界，Android手机的销量对iOS平台形成压倒之势。据市场研究机构Kantar Worldpanel的数据，Android占据智能手机市场份额的八成以上，而iOS虽然位居第二，但被远远甩在身后。从这一指标来看，Android无疑是赢家，但这还不够。";
        
        XFContentFragmentModel *paragrap3 = [XFContentFragmentModel new];
        paragrap3.type = XFContentFragmentTypeText;
        paragrap3.value = @"在考虑问题时，其他几个数据与市场份额具有同样的重要性。首先得看所获利润的份额。从这个角度来看，两大平台所占份额不仅出现发转，而是呈现惊人的结果。苹果公司占据了九成以上的利润。此外，从应用商店的营收来看，苹果CEO蒂姆•库克(Tim Cook)所领导的团队同样大获全胜。当从经济角度研究各项指标时，Android难以与iOS相提并论。";
        
        XFContentFragmentModel *paragrap4 = [XFContentFragmentModel new];
        paragrap4.type = XFContentFragmentTypeText;
        paragrap4.value = @"不过，由于有一家公司的存在，使得Android还能跟各种表格上的优异数据扯上关系。如果没有三星电子，Android阵营就只剩下大量的小型生产商，他们主打的还是低利润率的廉价手机，在高端领域只能偶露峥嵘。苹果在高端领域占据主导地位，三星电子实施了出色的反击，其他厂商则处于各自应有的位置。";
        
        XFContentFragmentModel *paragrap5 = [XFContentFragmentModel new];
        paragrap5.type = XFContentFragmentTypeText;
        paragrap5.value = @"如果没有三星电子，Android的境遇可能远远不如现在。";
        
        XFContentFragmentModel *image1 = [XFContentFragmentModel new];
        image1.type = XFContentFragmentTypeImage;
        image1.value = @"http://img.mt.shequzhidahao.com:3004/hello?id=784241655971028779";
        
        XFContentFragmentModel *paragrap6 = [XFContentFragmentModel new];
        paragrap6.type = XFContentFragmentTypeText;
        paragrap6.value = @"手机厂商时不时就会郑重推出一款Android手机，并自我标榜是这一平台最好的手机产品。这种产品很少取得成功，即使有成功的案例也难以延续辉煌。索尼就是其中的典型案例。经过数代产品的琢磨，索尼终于解决了设计问题，其Xperia系列产品提供了一种高端Android手机体验，并获得评论人士的称赞，但却没能俘获消费者的芳心。";
        
        XFContentFragmentModel *paragrap7 = [XFContentFragmentModel new];
        paragrap7.type = XFContentFragmentTypeText;
        paragrap7.value = @"近年来，摩托罗拉一度接近成为能够挑战三星电子的手机制造商，但是经历数位东家的倒手，该公司在过去两年缺乏连贯的战略。Moto最近推出的手机产品依然有着出众的表现，但是在销量和创收方面难以令人眼前一亮。";
        
        XFContentFragmentModel *paragrap8 = [XFContentFragmentModel new];
        paragrap8.type = XFContentFragmentTypeText;
        paragrap8.value = @"谷歌(微博)的Nexus手机因坐拥软件设计方面的优势而颇受人关注。不过，由谷歌推广的Nexus手机在销量上无法与三星电子Galaxy手机相提并论。对于研发者和科技发烧友，Nexus手机无疑是一个不错的选择，但是该手机难以成为强势的消费者品牌。";
        
        XFContentFragmentModel *paragrap9 = [XFContentFragmentModel new];
        paragrap9.type = XFContentFragmentTypeText;
        paragrap9.value = @"如果不算三星电子，Android的优势主要依赖中国手机制造商，并在发展中国家的低端手机中占据主导地位。这一情形可以保证出货量、但是对于利润和形象几乎没有提升作用，消费者也不愿意在第三方生态系统消费，这样一来，研发者和广告商也难以获得理想的回报。";
        
        XFContentFragmentModel *image2 = [XFContentFragmentModel new];
        image2.type = XFContentFragmentTypeImage;
        image2.value = @"http://img.mt.shequzhidahao.com:3004/hello?id=437160194644328838";
        
        XFContentFragmentModel *paragrap10 = [XFContentFragmentModel new];
        paragrap10.type = XFContentFragmentTypeText;
        paragrap10.value = @"对于上述难题，三星电子提供了答案，并为之努力多年。使用创新元素的三星电子旗舰机型在销量上能与iPhone相当。Galaxy S7系列产品在性能上毋庸置疑，要比普通的Android熊猫机强太多。";
        
        XFContentFragmentModel *paragrap11 = [XFContentFragmentModel new];
        paragrap11.type = XFContentFragmentTypeText;
        paragrap11.value = @"出色的设计同样也得到了营销的大力支持，三星电子不断向消费者推销其最新产品。在很多国家，人们喜欢拿Galaxy与iPhone作比较，而三星电子愿意投入，使得Galaxy品牌在营销上处于领先地位。";
        
        
        XFContentFragmentModel *paragrap12 = [XFContentFragmentModel new];
        paragrap12.type = XFContentFragmentTypeText;
        paragrap12.value = @"通过对产品线做出一些冒险的决定，并采取了理性的态度，三星电子的移动业务扭转了营收和利润在近两年下滑的颓势。Galaxy S7系列产品无疑立了大功，虽然下半年表现如何还有待观察，但仍显示出积极的信号。";
        
        XFContentFragmentModel *paragrap13 = [XFContentFragmentModel new];
        paragrap13.type = XFContentFragmentTypeText;
        paragrap13.value = @"当然，三星电子也推出中低端手机提高整体销量，这些产品因该公司旗舰产品的推广也连带受益。此外，三星电子还愿意在生态系统进行投入，以保持其在Android阵营中的顶端位置，继续咬住苹果。";
        
        XFContentFragmentModel *image3 = [XFContentFragmentModel new];
        image3.type = XFContentFragmentTypeImage;
        image3.value = @"http://img.mt.shequzhidahao.com:3004/hello?id=663145184310305409";
        
        XFContentFragmentModel *paragrap14 = [XFContentFragmentModel new];
        paragrap14.type = XFContentFragmentTypeText;
        paragrap14.value = @"Android生态系统应该感谢三星电子，因为三星电子能帮助其保住主导地位。如果没有三星电子，谷歌的Android平台在与注重利润的苹果平台相比，更显得弱势。不过，三星电子和Android也是共生共荣的关系。三星电子选择得到广泛应用的Android平台，就有大量的第三方提供软件应用。与此同时，三星电子的手机给予消费者信心，其能够让用户在Android手机完成任何想做的工作。";
        
        XFContentFragmentModel *paragrap15 = [XFContentFragmentModel new];
        paragrap15.type = XFContentFragmentTypeText;
        paragrap15.value = @"Android成功的核心在于两家公司的关系紧密地捆绑在一起。如果这一层关系弱化，两家公司都将面临痛苦的后果。谷歌知道，三星电子知道，当然苹果也知道这一点。（编译/李路）";
        
        XFContentFragmentModel *paragrap16 = [XFContentFragmentModel new];
        paragrap16.type = XFContentFragmentTypeText;
        paragrap16.value = @"推荐：热到宕机的互联网话题，秘而不宣的圈内谈资，尽在404Page（微信号：404Page）！";
        
        XFContentFragmentModel *image4 = [XFContentFragmentModel new];
        image4.type = XFContentFragmentTypeImage;
        image4.value = @"http://ocb5wk9sq.bkt.clouddn.com/1471863302.png";
        
        self.fragmentModels = @[paragrap1, paragrap2, paragrap3, paragrap4, paragrap5, image1, paragrap6, paragrap7, paragrap8, paragrap9, image2, paragrap10, paragrap11, paragrap12, paragrap13, image3, paragrap14, paragrap15, paragrap16, image4];
        
        self.content = [XFHTMLConfigurator connectToHTMLStringWith:self.fragmentModels];
    }
    return self;
}

@end
