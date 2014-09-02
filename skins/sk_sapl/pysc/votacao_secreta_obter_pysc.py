## Script (Python) "votacao_secreta_obter_pysc"
##bind container=container
##bind context=context
##bind namespace=
##bind script=script
##bind subpath=traverse_subpath
##parameters=sec=None, resultado=None
##title=
##

from Products.CMFCore.utils import getToolByName

st = getToolByName(context, 'portal_sapl')

REQUEST = context.REQUEST

lista = st.ler_token()


if sec:
    token_cookie = REQUEST.get('__token', None)

    voto = ''

    for item in lista:
        if token_cookie == item.keys()[0]:
            voto = item[item.keys()[0]][1]
            break

    return voto

if resultado:

    votacao = {}

    sim = 0
    nao = 0
    abstencao = 0

    for item in lista:
        if item[item.keys()[0]][1] == "Sim":
            sim += 1
        elif item[item.keys()[0]][1] == "Não":
            nao += 1
        elif item[item.keys()[0]][1] == "Abstenção":
            abstencao += 1

    votacao['sim'] = sim
    votacao['nao'] = nao
    votacao['abstencao'] = abstencao

    return votacao
