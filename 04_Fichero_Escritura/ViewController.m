//
//  ViewController.m
//  04_Fichero_Escritura
//
//  Created by Alumno on 07/11/16.
//  Copyright © 2016 Alumno. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1 - Crear el diccionario
    NSMutableDictionary* diccionario = [[NSMutableDictionary alloc ]init];
    [diccionario setObject:@"Bud Spencer" forKey:@"nombre"];
    [diccionario setObject:@"34" forKey:@"codigo"];
    [diccionario setObject:@"wisconsi" forKey:@"direccion"];
    
    //2 - Como en iOs no podemos crear ni modificar ficheros dentro de la app, debemos guardarlo en otro sitio como el documents del dispositivo.
    NSArray* rutas = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //Solo hay una ya que la carpeta document sólo hay una.
    NSString* rutaDocument = [rutas objectAtIndex:0];
    
    //3 - Construir la ruta donde vamos a querer guardar nuestro documento "plist"
    NSString* rutaFichero = [rutaDocument stringByAppendingPathComponent:@"preferencias.plist"];
    
    //4 - La creacion del plist a partir del diccionario
    [diccionario writeToFile:rutaFichero atomically:YES];
    
    //Luego habria que leerlo
    //Esto seria un poco tonto hacerlo en el mismo metodo porque ya tengo el diccionario creado arriba. Lo usamos sólo a modo ejemplo, porque los datos del diccionario2 son los mismos que los del diccionario.
    NSDictionary* diccionario2 = [[NSDictionary alloc]initWithContentsOfFile:rutaFichero];
    
    NSString* nombre = (NSString*)[diccionario2 objectForKey:@"nombre"];
    NSLog(@"%@",nombre);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
