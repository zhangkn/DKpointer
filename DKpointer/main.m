//
//  main.m
//  DKpointer
//
//  Created by devzkn on 14/01/2017.
//  Copyright © 2017 hisun. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *指针面试题
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        /**
         指针类型决定了指针的跨度，和取值字节数。
           数组类型指针的跨度为数组大小
           数组元素指针的跨度为元素占有内存的大小*/
      
//        --------1.一维数组 ------
        int array[4] = {10,20,30,40};
        int *p1 = array;// ------指向4个字节的空间  array 指向首元素的指针
        int (*p2)[4] = &array;//&(*p2) 和 &array 都是指向数组指针
//        ----- 例子： 1） 指针的移动+ 指针的跨度
        
        int *p = (int *)(&array+1);//
        NSLog(@"%d",*(p-1));// &array的跨度为16字节（因为数组是有4个int 类型的元素），p 是为int 类型的普通指针，跨度为4字节   答案为：array[0]的指针地址+16-4=array[0]的指针地址 +12=   40
        
        /*
         2） 详细分析
         0.  array 指向首元素的指针  指向4个字节的空间  -- int  类型指针
         1.  &array  指向数组的指针 指向16个字节的空间 -- int 类型数组指针
         2.  指针的移动 (p+1)  // 移动了对应指针类型的跨度
         */
        NSLog(@"%d,%d",(*p2)[1],array[1]);//20,20
        NSLog(@"%p,%p",&(*p2)+1,&array+1);//0x7fff5fbff750,0x7fff5fbff750
        //.  虽然p1 和*p2 地址一样，但意义完全不一样。 它们的指针类型 类型不一样，即跨度不一样。 类似于array同&array的关系 --
        NSLog(@"%p,%p",array+1,&array+1);//跨度不一样  0x7fff5fbff744,0x7fff5fbff750 array的跨度为4字节，,&array 为16字节
        NSLog(@"%d,%d",*(*p2),*array);//10,10         (*p2)和  array 指向首元素的指针
        NSLog(@"%p,%p,%p,%p,%p",p1,*p2,p2,array,&array[0]);//0x7fff5fbff740,0x7fff5fbff740,0x7fff5fbff740,0x7fff5fbff740,0x7fff5fbff740
       
        /**
         *
        2. 二维数组的举例   数组指针的跨度 为sizeof(数组)即数组的大小
        a[0]  代表值为a[0][0]的地址，跨度为4的指针
        a[1] 代表跨度为4字节，指向a[1][0]的指针
        a 指向a[0] 地址的数组指针，跨度为 12（跨度为元素数组的个数3*元素类型对应的字节4 = 12字节）
         &a 指向a[0]地址的二维数组指针，跨度为 24（跨度为元素数组的个数3*元素类型对应的字节4* 数组元素的个数）
         */
        int a[2][3] = {{1,2,3},{100,200,300}};
        
        
        //----  例子 ---
        int *pointer = (int *)(a+1);//+12 因为a的指针类型的跨度12*1 =12
        NSLog(@"%d",*(pointer -2));// -8  因为pointer的指针类型的跨度4*2 =8  相当于a[0][0]的指针地址+4 = a[0][1]=2

        //详细分析
        NSLog(@"%p,%p,%p",&a[0][0],a[0],a[0]+1);//0x7fff5fbff720,0x7fff5fbff720,0x7fff5fbff724
        
        NSLog(@"%p,%p,%p",&a[0],a,a+1);//0x7fff5fbff720,0x7fff5fbff720,0x7fff5fbff72c
        NSLog(@"%p,%p,%p,%lu",&a[0],&a,&a+1,sizeof(a));//0x7fff5fbff720,0x7fff5fbff720,0x7fff5fbff738,24

        
        
        
        
        
        
        
        
    }
    return 0;
}
