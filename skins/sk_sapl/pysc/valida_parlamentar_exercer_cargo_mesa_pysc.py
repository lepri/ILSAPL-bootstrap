## Script (Python) "valida_parlamentar_exercer_cargo_mesa_pysc"
##bind container=container
##bind context=context
##bind namespace=
##bind script=script
##bind subpath=traverse_subpath
##parameters=cod_parlamentar='', num_legislatura='', cod_sessao_leg='', ind_excluido=0
##title=
##
'''
  Funcao: validar se o parlamentar estÃ¡ ativo e se pode exercer ou nÃ£o um cargo na mesa diretora retornando 1=ok, None=nÃ£o pode

  Argumento: cod_parlamentar, cod_sessao_leg, num_legislatura

  Retorno: 1-ok, None=nÃ£o pode.

'''

if (cod_parlamentar==''):
   return None

if cod_sessao_leg=='':
   return None

if num_legislatura=='':
   return None

p=int(cod_parlamentar)
csl=int(cod_sessao_leg)
nl=int(num_legislatura)

''' verifica se a legislatura do parlamentar eh a Ãºltima mais recente - se nÃ£o for a Ãºltima entÃ£o nÃ£o importa se o parlamentar estÃ¡ ou nÃ£o ativo'''
num_ultima_leg=context.zsql.legislatura_ultima_obter_zsql(ind_excluido=0)[0].num_legislatura
nultleg=int(num_ultima_leg)
if nl<>nultleg:
   return 1
else:
   pass
''' verifica se a sessÃ£o legislativa do parlamentar eh a Ãºltima mais recente na legislatura - se nÃ£o for a Ãºltima entÃ£o nÃ£o importa se o parlamentar estÃ¡ ou nÃ£o ativo'''
cod_ultima_sleg=context.zsql.sessao_legislativa_ultima_obter_zsql(num_legislatura=nultleg, ind_excluido=0)[0].cod_sessao_leg
cod_ultsleg=int(cod_ultima_sleg)
if csl<>cod_ultsleg:
   return 1
else:
   pass

'''num_legislatura e cod_sessao_leg sÃ£o os mais recentes. Nesse caso, o parlamentar deve estar ativo na CÃ¢mara; ou seja ind_ativo=1'''
for i in context.zsql.parlamentar_ativo_obter_zsql(ind_excluido=0):
    if p==int(i.cod_parlamentar):
       return 1
    else:
       pass

return None
