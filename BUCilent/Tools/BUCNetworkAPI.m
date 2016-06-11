//
//  BUCNetworkAPI.m
//  BUCilent
//
//  Created by dito on 16/5/8.
//  Copyright © 2016年 zouzhigang. All rights reserved.
//

#import "BUCNetworkAPI.h"

@implementation BUCNetworkAPI


//BITOpenAPI  POST
NSString *const kApiLogin = @"/open_api/bu_logging.php";
NSString *const kApiForumList = @"/open_api/bu_forum.php";
NSString *const kApiThread = @"/open_api/bu_thread.php";
NSString *const kApiPostDetail = @"/open_api/bu_post.php";
NSString *const kApiNewPost = @"/open_api/bu_newpost.php";
NSString *const kApiAccountDetail = @"/open_api/bu_profile.php";
NSString *const kApiForumTag = @"/open_api/bu_forumtag.php";
NSString *const kApiFidTidCount = @"/open_api/bu_logging.php";
NSString *const kApiHome = @"/open_api/bu_home.php";
NSString *const kApiTidOrFid = @"/open_api/bu_fid_tid.php";


//api form spider
NSString *const kApiFavorite = @"/api/v2/favorite"; //POST  Delete
NSString *const kApiFavoriteList = @"/api/v2/favorite/list"; //GET
NSString *const kApiFavoriteStatus = @"/api/v2/favorite/status"; //GET
NSString *const kApiSearchThreads = @"/api/v2/search/threads"; //GET


NSString *const kLPNetworkRequestShowEmptyPageWhenError = @"kLPNetworkRequestShowEmptyPageWhenError";

+ (NSString *)requestURL:(NSString *)requestURL {
    NSString *URLString;
    if ([self checkURLIsBITOpenAPI:requestURL]) {
        URLString = [self baseURL];
    } else {
        URLString = @"http://bu.ihainan.me:8080";
    }
    return [NSString stringWithFormat:@"%@%@", URLString, requestURL];
}

+ (NSString *)baseURL {
    return @"http://out.bitunion.org";
#ifdef DEBUG
    return @"http://ydsj.didaaa.com";
#else
    return @"http://ydsj.didaaa.com";
#endif
}

+ (BOOL)checkURLIsBITOpenAPI:(NSString *)requestURL{
    __block BOOL isBITOpenAPI = NO;
    NSArray *urlArray = @[kApiLogin, kApiForumList, kApiThread, kApiPostDetail, kApiNewPost, kApiAccountDetail, kApiForumTag, kApiFidTidCount, kApiHome, kApiTidOrFid];
    
    [urlArray enumerateObjectsUsingBlock:^(NSString *url, NSUInteger idx, BOOL *stop) {
        if ([url isEqualToString:requestURL]) {
            isBITOpenAPI = YES;
            *stop = YES;
        }
    }];

    return isBITOpenAPI;
}

@end
/*
 http://www.bitunion.org/open_api/bu_logging.php     登录
 
 http://www.bitunion.org/open_api/bu_logging.php  退出
 
 
 http://www.bitunion.org/open_api/bu_forum.php  论坛列表
 
 http://www.bitunion.org/open_api/bu_thread.php  查询论坛帖子
 
 http://www.bitunion.org/open_api/bu_post.php   查询帖子详情
 
 http://www.bitunion.org/open_api/bu_profile.php   查询用户详情
 
 
 http://www.bitunion.org/open_api/bu_newpost.php  回复帖子
 
 
 
 http://www.bitunion.org/open_api/bu_forumtag.php  //查询论坛分类
 
 http://www.bitunion.org/open_api/bu_newpost.php  发布新帖
 
 http://www.bitunion.org/open_api/bu_home.php  查询论坛最新帖子
 
 ：http://www.bitunion.org/open_api/bu_fid_tid.php
 
 
 */