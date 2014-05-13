//
//  main.m
//  webServiceCEP
//
//  Created by ALS on 05/05/14.
//  Copyright (c) 2014 Cotrim. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "endereco.h"

int main(int argc, char *argv[])
{
    endereco *casa = [[endereco alloc] initWithCep:@"72006575"];

    NSLog(@"%@",casa);
    
    NSError *erro;
    
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
    NSMutableString* pathOfDirectory =[paths objectAtIndex:0];
    

    NSLog(@"%@\n",pathOfDirectory);
    
    NSString* pathFile = [pathOfDirectory stringByAppendingFormat: @"/saida.txt"];
    
    
    [[casa description] writeToFile:pathFile
                         atomically:YES
                           encoding:NSUTF8StringEncoding
                              error:&erro];
    if(erro)
        NSLog(@"Erro ao escrever em arquivo: %@",[erro description]);
    
    return NSApplicationMain(argc, (const char **)argv);
}
