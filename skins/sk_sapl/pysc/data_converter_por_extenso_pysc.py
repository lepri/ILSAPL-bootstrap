## Script (Python) "data_converter_pysc"
##bind container=container
##bind context=context
##bind namespace=
##bind script=script
##bind subpath=traverse_subpath
##parameters=data
##title=
##
"""
  Funcaoo: Converter a data do formato DD/MM/AAAA para
          o formato AAAA/MM/DD, e depois converter em dia da semana
          Ex: sexta-feira.
  
  Argumento: Data a ser convertida.
  
  Retorno: Dia da semana.
"""

meses=['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro']

if data != '':
    mes = int(data[3:5])
    return data[0:2] + " de " + meses[int(mes-1)] + " de " + data[6:]
else:
   return ''
