//
//  endereco.m
//  webServiceCEP
//
//  Created by ALS on 05/05/14.
//  Copyright (c) 2014 Cotrim. All rights reserved.
//

#import "endereco.h"

@implementation endereco
-(instancetype)initWithCep:(NSString*) cep{
    
    NSMutableString *pokemon = [[NSMutableString alloc] initWithString:@"http://pokemondb.net/pokedex/articuno"];
    NSError *erroRespostaPokemon;
    NSURLRequest *requestPokemon = [NSURLRequest requestWithURL:[NSURL URLWithString:pokemon]];
    NSData *responsePokemon = [NSURLConnection sendSynchronousRequest:requestPokemon
                                             returningResponse:nil
                                                         error:&erroRespostaPokemon];
    
    if (erroRespostaPokemon == NULL) {
        NSLog(@"%@",responsePokemon);		
    }
    
    
    self.CEP = cep;
    NSMutableString *strWebService = [[NSMutableString alloc] initWithString:@"http://appservidor.com.br/webservice/cep?cep="];
    [strWebService appendString:cep];
    [strWebService appendString:@"&saida=json"];

    NSError *erroResposta;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:strWebService]];
    NSData *response = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:nil
                                                         error:&erroResposta];
    NSError *erroJson;
    NSDictionary *contentOfWebService = [NSJSONSerialization JSONObjectWithData:response options:0 error:&erroJson];

    self.logradouro = [contentOfWebService objectForKey:@"logradouro"];
    self.logradouro_nome = [contentOfWebService objectForKey:@"logradouro_nome"];
    self.logradouro_completo = [contentOfWebService objectForKey:@"logradouro_completo"];
    self.bairro = [contentOfWebService objectForKey:@"bairro"];
    self.cidade = [contentOfWebService objectForKey:@"cidade"];
    self.uf_sigla = [contentOfWebService objectForKey:@"uf_sigla"];
    self.uf_nome = [contentOfWebService objectForKey:@"uf_nome"];
    
    return self;
}

-(NSString *)description{
    return [NSString stringWithFormat:@"CEP: %@ \n Logradouro: %@ \n Logradouro_nome: %@ \n Logradouro_completo: %@ \n Bairro: %@ \n Cidade: %@ \n UF_sigla: %@ \n UF_nome: %@",self.CEP,self.logradouro,self.logradouro_nome,self.logradouro_completo,self.bairro,self.cidade,self.uf_sigla,self.uf_nome];
}

@end
