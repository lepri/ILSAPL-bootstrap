## Script (Python) "ausentes_sessao_pysc"
##bind container=container
##bind context=context
##bind namespace=
##bind script=script
##bind subpath=traverse_subpath
##parameters=cod_sessao_plen, cod_num_legislatura
##title=
##
""" Retorna os parlamentares ausentes na sessao
"""

presenca = len(context.zsql.presenca_sessao_obter_zsql(cod_sessao_plen=cod_sessao_plen,ind_excluido=0))
parlamentares = len(context.zsql.parlamentar_obter_zsql(num_legislatura = cod_num_legislatura, ind_ativo=1, ind_excluido=0))

ausentes = parlamentares - presenca

return ausentes

