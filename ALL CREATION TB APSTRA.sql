SELECT bl.[NumeroPrestamo]
      ,bl.[Usuario]
      ,convert(varchar,FechaBloqueo,103) FechaBloqueo
      ,bl.[NotaBloqueo]
      ,bl.[MontoAprobado]
      ,bl.[DiasAtrasado]
      ,bl.[DiaPago]
      ,bl.[MontoDesembolsado]
      ,bl.[MontoDisponilbe]
      ,bl.[CuotasVencidas]
      ,bl.[Monto_Ultimo_Pago]
      ,bl.[FechaUltimoCobro]
      ,bl.[BalanceCapital]
      ,bl.[CodigoAnalista]
      ,bl.[Analista]
      ,bl.[CodigoViaPago]
      ,bl.[ViaPago]
      ,bl.[CodigoControlSeguimiento]
      ,bl.[ControlSeguimiento]
      ,bl.[TipoPrestamo] ClasificacionPrestamo
      ,bl.[OficialCobros]
      ,bl.[Cobrador]
      ,bl.[TC_BDI]
      ,da.vencimiento_gracia 	  
  FROM [dbo].[apstra_bloqueados] bl
  LEFT JOIN CDR...[Datos_Adicionales_Apstra] Da on bl.NumeroPrestamo = da.numecont


SELECT * FROM CDR...[Datos_Adicionales_Apstra]


INSERT INTO CDR...[Datos_Adicionales_Apstra]
(NUMECONT, CODIPRES, C_FONDO_EXTERNO, C_ESTADO, CODIGO_CLASIFICACION, CLASIFICACION, C_ESTADO_ACUERDO,
ENTI_PAGA_IDEN, ENTI_PAGA_DESCRI, FECHA_ULTIMO_DESEMBOLSO, MONTO_ULTIMO_DESEMBOLSO, C_ID_CARACTERISTICA,
C_CARACTERISTICA, VENCIMIENTO_GRACIA, CANTIDAD_VECES_MORA)

SELECT NUMECONT, CODIPRES, C_FONDO_EXTERNO, C_ESTADO, CODIGO_CLASIFICACION, CLASIFICACION, C_ESTADO_ACUERDO,
ENTI_PAGA_IDEN, ENTI_PAGA_DESCRI, FECHA_ULTIMO_DESEMBOLSO, MONTO_ULTIMO_DESEMBOLSO, C_ID_CARACTERISTICA,
C_CARACTERISTICA, VENCIMIENTO_GRACIA, CANTIDAD_VECES_MORA
 FROM [Datos_Adicionales_Apstra]




select * from [dbo].[F_proxima_cuota_pendiente]


INSERT INTO CDR...[ConceptoUltimoCobro]
(Nombre, Cedula, Empresa, DiasAtraso, Balance_Atraso,
Codigo_Via_de_Pago, Codigo_Control_de_Seguimiento, Control_de_Seguimiento,
Fecha_Ultimo_Cobro, Concepto_de_Ultimo_Cobro)
SELECT Nombre, Cedula, Empresa, DiasAtraso, Balance_Atraso,
Codigo_Via_de_Pago, Codigo_Control_de_Seguimiento, Control_de_Seguimiento,
Fecha_Ultimo_Cobro, Concepto_de_Ultimo_Cobro from [Concepto_Ultimo_Cobro]



SELECT 
       f.No_Prestamo,      f.estatus_perstamo, 
      f.Nombre,			 f.Apellidos, 
       f.Identificacion,   f.Direccion, 
       f.Sector,       f.Ciudad, 
       f.Provincia,        f.E_Mail, 
       f.E_mail2,        f.Telefono_Celular, 
       f.Nota_Celular,        f.Telefono_Linea_Directa, 
       f.Nota_Linea_Directa,        f.Telefono_Central, 
	   f.Telefono_Casa, 
       f.Nota_Casa,        f.Telefono_Trabajo, 
	   f.Nota_Trabajo,        f.Monto_Aprobado, 
       f.Balance_Capital,        f.Balance_Actual, 
       f.Interes_Atraso,        f.proxima_cuota, 
       f.Total_cargos,        f.cargos, 
       f.DiasAtraso,        f.Monto_Desembolsado, 
       f.Disponible,        f.Fecha_Prestamo, 
       f.Fecha_Vencimiento,        f.Cuota_Mensual, 
       f.Ultima_Cuota_Cancelada,        f.Dia_Cuota, 
       f.Plazo,        f.Tasa_Interes, 
       f.Monto_Ultimo_Cobro,        f.Fecha_Ultimo_Cobro, 
       f.Fecha_Castigo,        f.Oficial_Negocios, 
       f.Representante,        f.Codigo_Cobrador, 
       f.Cobrador,        f.Codigo_Analista, 
       f.Analista,        f.Via_de_Pago, 
       f.codigo_control_seguimiento,        f.Control_Seguimiento, 
       f.Tipo_Credito,        f.Empresa_Trabajo, 
       f.CATEGORIA,      f.DESCRESP  respuesta, 
       f.Fecha_respuesta,        f.Fecha_carta, 
       f.Fecha_renegociado,        f.Fecha_reestructurado, 
       f.Fecha_intimacion,         f.Fecha_Fin_Estudio,  
       f.codigo_oficial_cobro,        f.nombre_oficial_cobro, 
       f.cuotasV,         f.PORCIENTO_MOROSIDAD,  
       f.iden_tipo_negocio,        f.nombre_tipo_negocio, f.Nota_Central Firma_Adobe
	   ,uc.Nombre_usuario usuario_comentario, uc.Nota Comentario,
       #CONVERT(varchar, ,103)
       uc.fecha fecha_comentario,
	   up.Monto_Ultimo_Cobro,
       up.Fecha_Ultimo_Cobro,
       up.Concepto_de_Ultimo_Cobro, 
       #convert(varchar, ,103)
       pcp.FECHCUOT Proxima_Cuota_pendiente
	   , daa.C_FONDO_EXTERNO,
		daa.C_ESTADO,
		daa.CODIGO_CLASIFICACION,
		daa.CLASIFICACION ,
		daa.C_ESTADO_ACUERDO,
		daa.ENTI_PAGA_IDEN,
		daa.ENTI_PAGA_DESCRI,
		daa.FECHA_ULTIMO_DESEMBOLSO,
		daa.MONTO_ULTIMO_DESEMBOLSO,
         daa.C_ID_CARACTERISTICA,
        daa.C_CARACTERISTICA
		#isnull(daa.CANTIDAD_VECES_MORA,0) CANTIDAD_VECES_MORA
FROM fuente_apstra f
LEFT JOIN UltimoComentario uc on uc.Numero_Prestamo = f.No_Prestamo
LEFT JOIN ConceptoUltimoCobro up on up.prestamo = f.No_Prestamo
LEFT JOIN proxima_cuota_pendiente pcp on pcp.codipres = f.CODIPRES
LEFT JOIN Datos_Adicionales_Apstra daa on daa.codipres = f.codipres
WHERE f.estatus_perstamo = 'A'


select * from CDR...[Financ_Apstra.dbo.fuente_apstra_temp]




EXEC sp_help select * from fuente_apstra;

SELECT * FROM CDR...[fuente_apstra]
SELECT * FROM --CDR...
[fuente_apstra]


-- [fuente_apstra]
SET NOCOUNT ON
SET ANSI_WARNINGS ON

GO
INSERT INTO CDR...[fuente_apstra]
SELECT  * FROM fuente_apstra where fecha_respuesta > '2022-12-15 00:00:00.000'; --'2021-01-01 00:00:00.000' ;


SELECT * FROM CDR...[fuente_apstra]


INSERT INTO CDR...[apstra_bloqueados]
(NumeroPrestamo, Usuario, FechaBloqueo, NotaBloqueo, MontoAprobado, DiasAtrasado, DiaPago,  MontoDesembolsado, MontoDisponilbe, CuotasVencidas,
Monto_Ultimo_Pago, BalanceCapital, CodigoAnalista, Analista, CodigoViaPago, ViaPago, CodigoControlSeguimiento, ControlSeguimiento, TipoPrestamo,
OficialCobros, Cobrador)
SELECT NumeroPrestamo, Usuario, FechaBloqueo, NotaBloqueo, MontoAprobado, DiasAtrasado, DiaPago,  MontoDesembolsado, MontoDisponilbe, CuotasVencidas,
Monto_Ultimo_Pago, BalanceCapital, CodigoAnalista, Analista, CodigoViaPago, ViaPago, CodigoControlSeguimiento, ControlSeguimiento, TipoPrestamo,
OficialCobros, Cobrador FROM  [dbo].[apstra_bloqueados]





INSERT INTO  CDR...[UltimoComentario]
SELECT TOP 15533 *
  FROM[dbo].[apstra_comentarios]
  ORDER BY Fecha desc

--SELECT *
--  FROM[dbo].[apstra_comentarios]
--  where Fecha > '2020-01-01 00:00:00.000'


  SELECT  * FROM fuente_apstra where fecha_respuesta > '2023-01-01 00:00:00.000';


  SELECT * FROM CDR...[ConceptoUltimoCobro]

  SELECT TOP 15533 *
  FROM[dbo].[apstra_comentarios]
  ORDER BY Fecha desc
  --where Fecha > '2020-01-01 00:00:00.000'


    SELECT *
  FROM CDR...[UltimoComentario] WHERE Codigo_Nota = '1427181'



SELECT * FROM   CDR...[apstra_bloqueados]
SELECT * FROM [apstra_bloqueados]