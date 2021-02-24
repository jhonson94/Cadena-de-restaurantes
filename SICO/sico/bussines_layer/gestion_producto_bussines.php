<?php	
	if (!function_exists('catalogo_producto')){
		
		function catalogo_producto($estado,$empresa)
			{		
				foreach (glob("../persistence_layer/*.php") as $filename)
				{
					include $filename;
				}
				include ("../class/producto.php");
				$producto = consulta_product($estado,$empresa);	
				foreach ($producto as $pro) 
				{	
					$clase_producto = new producto;	
					$clase_producto->__construct2($pro["id_producto"],$pro["no1"],null,$pro["precio"],$pro["no2"],null,$pro["url"],$pro["estado"]);	
					$arreglo_clases[]=$clase_producto;
				}	
			return $arreglo_clases;
			}
	}
	if (!function_exists('catalogo_empresas2')){
		function catalogo_empresas2()
		{		
			include ("../class/producto.php");
			foreach (glob("../persistence_layer/*.php") as $filename)
			{
				include $filename;
			}
			$empresas = consulta_empresas2();
			foreach ($empresas as $emp) 
				{
					$clase_producto = new producto;	
					$clase_producto->set_empresa($emp["nombre"]);	
					$arreglo_clases[]=$clase_producto;				
				}
			return $arreglo_clases;
		}
	}
	
	if (!function_exists('recuperar_producto')){
		function recuperar_producto($id)
		{		
			include ("../class/producto.php");
			foreach (glob("../persistence_layer/*.php") as $filename)
			{
				include $filename;
			}
			$rowPro=consultar_producto($id);
			$clase_producto = new producto;	
			$clase_producto->__construct2($rowPro["id_producto"],$rowPro["nombre"],$rowPro["descripcion"],$rowPro["precio"],$rowPro["id_empresa"],$rowPro["stock"],$rowPro["url"],$rowPro["estado"]);								
			return $clase_producto;
		}
	}
	
	if (!function_exists('insertar_producto')){
		function insertar_producto($nombre,$descripcion,$precio,$empresa,$stock,$url,$estado)
		{	
			include ("../class/producto.php");
			foreach (glob("../persistence_layer/*.php") as $filename)
			{
				include $filename;
			}
			$clase_producto = new producto;	
			$clase_producto->__construct2(null,$nombre,$descripcion,$precio,$empresa,$stock,$url,$estado);		
			ingresar_producto($clase_producto->get_nombre(),$clase_producto->get_descripcion(),$clase_producto->get_precio(),$clase_producto->get_empresa(),$clase_producto->get_stock(),$clase_producto->get_url(),$clase_producto->get_estado());
		}
	}
	
	if (!function_exists('recuperar_empresa')){
		function recuperar_empresa($empresa)
		{		
			include ("../class/producto.php");
			foreach (glob("../persistence_layer/*.php") as $filename)
			{
				include $filename;
			}
			$rowEmp=consultar_empresa($empresa);
			$clase_producto = new producto;	
			$clase_producto->set_empresa($rowEmp["id_empresa"]);				
			return $clase_producto;
		}
	}
	
	if (!function_exists('actualizar_producto')){
		function actualizar_producto($nombre,$descripcion,$precio,$empresa,$stock,$url,$id)
		{	
			include ("../class/producto.php");
			foreach (glob("../persistence_layer/*.php") as $filename)
			{
				include $filename;
			}
			$clase_producto = new producto;	
			$clase_producto->__construct2($id,$nombre,$descripcion,$precio,$empresa,$stock,$url,1);		
			modificar_producto($clase_producto->get_nombre(),$clase_producto->get_descripcion(),$clase_producto->get_precio(),$clase_producto->get_empresa(),$clase_producto->get_stock(),$clase_producto->get_url(),$clase_producto->get_id_producto());			
		}
	}
	
	if (!function_exists('baja_alta_producto2')){
		function baja_alta_product($id,$estado)
		{	
			foreach (glob("../persistence_layer/*.php") as $filename)
			{
				include $filename;
			}
			baja_alta_producto($id,$estado);
		}
	}
	
	if (!function_exists('busqueda_producto')){
		
		function busqueda_producto($estado,$empresa,$criterio)
			{		
				foreach (glob("../persistence_layer/*.php") as $filename)
				{
					include $filename;
				}
				include ("../class/producto.php");
				$producto = busque_product($estado,$empresa,$criterio);	
				foreach ($producto as $pro) 
				{	
					$clase_producto = new producto;	
					$clase_producto->__construct2($pro["id_producto"],$pro["no1"],null,$pro["precio"],$pro["no2"],null,$pro["url"],$pro["estado"]);	
					$arreglo_clases[]=$clase_producto;
				}	
			return $arreglo_clases;
			}
	}
	
?>