//
//  TrafficV.m
//  TrafficV
//
//  Created by test on 2018/4/9.
//  Copyright © 2018年 com.youlu. All rights reserved.
//

#import "TrafficV.h"
#import "UIButton+ST_FixMultiClick.h"
@implementation TrafficV
- (void)drawRect:(CGRect)rect {
    [self setUpUI];
}
- (void)setUpUI{
    _monitorIV = [[UIImageView alloc] init ];
    _monitorIV.backgroundColor = [UIColor whiteColor];
    [self addSubview:_monitorIV];

    _LDis = [[UILabel alloc] init ];
    _LDis.font = [UIFont systemFontOfSize:16];
    _LDis.backgroundColor = [UIColor redColor];
    _LDis.textColor = [UIColor whiteColor];
    _LDis.textAlignment = NSTextAlignmentLeft;
    _LDis.text = @"左轮里程：";
    [self addSubview:_LDis];

    _LVals = [[UILabel alloc] init ];
    _LVals.font = [UIFont systemFontOfSize:16];
    _LVals.backgroundColor = [UIColor redColor];
    _LVals.textColor = [UIColor whiteColor];
    _LVals.textAlignment = NSTextAlignmentLeft;
    _LVals.text = @"0.000cm";   //左轮里程值
    [self addSubview:_LVals];

    _RDis = [[UILabel alloc] init ];
    _RDis.font = [UIFont systemFontOfSize:16];
    _RDis.backgroundColor = [UIColor redColor];
    _RDis.textColor = [UIColor whiteColor];
    _RDis.textAlignment = NSTextAlignmentLeft;
    _RDis.text = @"右轮里程：";
    [self addSubview:_RDis];

    _RVals = [[UILabel alloc] init ];
    _RVals.font = [UIFont systemFontOfSize:16];
    _RVals.backgroundColor = [UIColor redColor];
    _RVals.textColor = [UIColor whiteColor];
    _RVals.textAlignment = NSTextAlignmentLeft;
    _RVals.text = @"0.000cm";   //右轮里程值
    [self addSubview:_RVals];

    _resetBtn =  [[UIButton alloc] init];
    [_resetBtn setTitle:@"复位" forState:UIControlStateNormal];
    [_resetBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _resetBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    _resetBtn.backgroundColor = [UIColor blackColor];
    _resetBtn.st_acceptEventInterval = 2;
    [_resetBtn addTarget:self action:@selector(toReset:)forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_resetBtn];


//    _dealV = [[UIView alloc] init ];
//    [self addSubview:_dealV];
//
//    _upV = [[UIButton alloc] init ];
//    [_upV setImage:[UIImage imageNamed:@"up.png"] forState:UIControlStateNormal];
//    [_upV addTarget:self action:@selector(upVTouchBegin:)forControlEvents:UIControlEventTouchDown];
//    [_upV addTarget:self action:@selector(upVTouchEnd:)forControlEvents:UIControlEventTouchUpInside];
//    [_upV addTarget:self action:@selector(upVTouchEnd:)forControlEvents:UIControlEventTouchUpOutside];
//    [_dealV addSubview:_upV];
//
//    _downV = [[UIButton alloc] init ];
//    [_downV setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
//    [_downV addTarget:self action:@selector(downVTouchBegin:)forControlEvents:UIControlEventTouchDown];
//    [_downV addTarget:self action:@selector(downVTouchEnd:)forControlEvents:UIControlEventTouchUpInside];
//    [_downV addTarget:self action:@selector(downVTouchEnd:)forControlEvents:UIControlEventTouchUpOutside];
//    [_dealV addSubview:_downV];
//
//    _leftV = [[UIButton alloc] init ];
//    [_leftV setImage:[UIImage imageNamed:@"left.png"] forState:UIControlStateNormal];
//    [_leftV addTarget:self action:@selector(leftVTouchBegin:)forControlEvents:UIControlEventTouchDown];
//    [_leftV addTarget:self action:@selector(leftVTouchEnd:)forControlEvents:UIControlEventTouchUpInside];
//    [_leftV addTarget:self action:@selector(leftVTouchEnd:)forControlEvents:UIControlEventTouchUpOutside];
//    [_dealV addSubview:_leftV];
//
//    _rightV = [[UIButton alloc] init ];
//    [_rightV setImage:[UIImage imageNamed:@"right.png"] forState:UIControlStateNormal];
//    [_rightV addTarget:self action:@selector(rightVTouchBegin:)forControlEvents:UIControlEventTouchDown];
//    [_rightV addTarget:self action:@selector(rightVTouchEnd:)forControlEvents:UIControlEventTouchUpInside];
//    [_rightV addTarget:self action:@selector(rightVTouchEnd:)forControlEvents:UIControlEventTouchUpOutside];
//    [_dealV addSubview:_rightV];

    _stJoyStickV = [[STJoyStickV alloc]initWithFrame:CGRectMake(self.frame.size.width/2 - 60,self.frame.size.height/2 - 60, 120, 120)];
     __weak __typeof(self)weakSelf = self;
    _stJoyStickV.centerB = ^(){
        [weakSelf.delegate toControl:8];
    };
    _stJoyStickV.angleBlock = ^(float sinX, float sinY) {
        //0:上  1:右上  2:右  3:右下  4:下  5:左下  6:左  7:左上   顺时针方向
        if ([NSString stringWithFormat:@"%f",sinX] != [NSString stringWithFormat:@"%f",0.000000]){
            if (sinX > 0 && sinY < 0){
                if ( (sinX > 0 &&  sinX < sin(M_PI/8)) && ((-sinY > cos(M_PI/8)) && (-sinY< 1))){
                    [weakSelf.delegate toControl:0];
                }else if ( (sinX > sin(M_PI/8) && sinX < cos(M_PI/8)) && ( -sinY > sin(M_PI/8) && -sinY < cos(M_PI/8))){
                    [weakSelf.delegate toControl:1];
                }else if ((sinX > cos(M_PI/8) && sinX < 1)  && (-sinY >0 && -sinY < sin(M_PI/8))){
                    [weakSelf.delegate toControl:2];
                }
            }else if (sinX > 0 && sinY > 0){
                if ( (sinX > cos(M_PI/8) && sinX < 1) && (sinY >0 && sinY < sin(M_PI/8))){
                    [weakSelf.delegate toControl:2];
                }else if ( (sinX > sin(M_PI/8) && sinX < cos(M_PI/8)) && ( sinY > sin(M_PI/8) && sinY < cos(M_PI/8))){
                    [weakSelf.delegate toControl:3];
                }else if ( (sinX > 0 &&  sinX < sin(M_PI/8)) && ((sinY > cos(M_PI/8)) && (sinY< 1))){
                    [weakSelf.delegate toControl:4];
                }
            }else if (sinX < 0 && sinY > 0){
                if ( (-sinX > 0 &&  -sinX < sin(M_PI/8)) && ((sinY > cos(M_PI/8)) && (sinY< 1))){
                    [weakSelf.delegate toControl:4];
                }else if ( (-sinX > sin(M_PI/8) && -sinX < cos(M_PI/8)) && ( sinY > sin(M_PI/8) && sinY < cos(M_PI/8))){
                    [weakSelf.delegate toControl:5];
                }else if ((-sinX > cos(M_PI/8) && -sinX < 1)  && (sinY >0 && sinY < sin(M_PI/8))){
                    [weakSelf.delegate toControl:6];
                }
            }else if (sinX < 0 && sinY < 0){
                if ((-sinX > cos(M_PI/8) && -sinX < 1) && (-sinY >0 && -sinY < sin(M_PI/8))){
                    [weakSelf.delegate toControl:6];
                }else if ( (-sinX > sin(M_PI/8) && -sinX < cos(M_PI/8)) && ( -sinY > sin(M_PI/8) && -sinY < cos(M_PI/8))){
                    [weakSelf.delegate toControl:7];
                }else if ((-sinX > 0 &&  -sinX < sin(M_PI/8)) && ((-sinY > cos(M_PI/8)) && (-sinY< 1)) ){
                    [weakSelf.delegate toControl:0];
                }
            }
        }
    };
    [self addSubview:_stJoyStickV];
    //添加约束
    [self setMas];
}
- (void) setMas{
    [_monitorIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(0);
        make.left.equalTo(self).offset(0);
        make.width.mas_equalTo(ScreenW);
        make.height.mas_equalTo(ScreenH);
    }];

    [_LDis mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(60*StScaleH);
        make.left.mas_equalTo(2*spaceM);
    }];

    [_LVals mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.LDis.mas_top);
        make.left.mas_equalTo(self.LDis.mas_right).offset(0);
    }];

    [_RDis mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.LDis.mas_bottom).offset(12*StScaleH);
        make.left.mas_equalTo(2*spaceM);
    }];

    [_RVals mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.RDis.mas_top);
        make.left.mas_equalTo(self.RDis.mas_right).offset(0);
    }];

    [_resetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.stJoyStickV.mas_bottom).offset(48*StScaleH);
        make.centerX.mas_equalTo(self);
        make.width.mas_equalTo(ScreenW/4);
    }];

//    [_dealV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self).offset(0);
//        make.right.equalTo(self).offset(0);
//        make.width.mas_equalTo(150);
//        make.height.mas_equalTo(150);
//    }];
//
//    [_upV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.dealV.mas_top).offset(0);
//        make.left.equalTo(self.dealV.mas_left).offset(50);
//        make.width.height.mas_equalTo(50);
//    }];
//
//    [_downV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.dealV.mas_bottom).offset(0);
//        make.left.equalTo(self.dealV.mas_left).offset(50);
//        make.width.height.mas_equalTo(50);
//    }];
//
//    [_leftV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.dealV.mas_top).offset(50);
//        make.left.equalTo(self.dealV.mas_left).offset(0);
//        make.width.height.mas_equalTo(50);
//    }];
//
//    [_rightV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.dealV.mas_top).offset(50);
//        make.right.equalTo(self.dealV.mas_right).offset(0);
//        make.width.height.mas_equalTo(50);
//    }];

//    [_stJoyStickV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self).offset(0);
//        make.left.equalTo(self).offset(0);
//        make.width.mas_equalTo(120);
//        make.height.mas_equalTo(120);
//    }];
}

-(void) toReset:(id)sender{
    [_delegate toReset];
}
//点击按钮触发事件
//-(void) upVTouchBegin:(id)sender{
//    _upTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target: self selector: @selector(toUpTimer:) userInfo: nil repeats: YES];
//    [_upTimer fire];
//}
//-(void) upVTouchEnd:(id)sender{
//    [_upTimer invalidate];
//}
//-(void) toUpTimer:(id)sender{
//    [_delegate toUp];
//}

//-(void) downVTouchBegin:(id)sender{
//    _downTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target: self selector: @selector(toDownTimer:) userInfo: nil repeats: YES];
//    [_downTimer fire];
//}
//-(void) downVTouchEnd:(id)sender{
//    [_downTimer invalidate];
//}
//-(void) toDownTimer:(id)sender{
//    [_delegate toDown];
//}

//-(void) leftVTouchBegin:(id)sender{
//    _leftTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target: self selector: @selector(toLeftTimer:) userInfo: nil repeats: YES];
//    [_leftTimer fire];
//}
//-(void) leftVTouchEnd:(id)sender{
//    [_leftTimer invalidate];
//}
//-(void) toLeftTimer:(id)sender{
//    [_delegate toLeft];
//}
//
//-(void) rightVTouchBegin:(id)sender{
//    _rightTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target: self selector: @selector(toRightTimer:) userInfo: nil repeats: YES];
//    [_rightTimer fire];
//}
//-(void) rightVTouchEnd:(id)sender{
//    [_rightTimer invalidate];
//}
//-(void) toRightTimer:(id)sender{
//    [_delegate toRight];
//}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
