## Script (Python) "norma_texto_buscar_pysc"
##bind container=container
##bind context=context
##bind namespace=
##bind script=script
##bind subpath=traverse_subpath
##parameters=assunto, tipo, numero, ano
##title=
##

from Products.AdvancedQuery import And, Or, Eq, Ge, In

query = Eq('PrincipiaSearchSource', assunto)

results = context.sapl_documentos.norma_juridica.Catalog.evalAdvancedQuery(query)

return results
