# Corrigir

## Anamnese

* Os dados referentes ao campo anm_DM estão sendo salvos com erros (dados não coletador).

* As frequências também são inconsistentes. Às vezes estão em maiúsculas outras vezes em minúsculas. Verificar se o banco é case insensitive.

## Avaliação

* Não existe o campo "dente" na tabela, porém ele está no formulário.

* As opções dos sintomas são inadequadas: radio113?? isso não faz sentido nenhum...

* Os valores da escala de dor não fazem sentido.

* As opções da duração do sintoma contêm a concordância errada, ou erros de grafia (continua, em vez de contínua).

* Na parte da coroa, há campos com o `name = ava_intraOral_coroa[]4`. Claramente isso não existe no banco de dados...

* O campo "Outras características" da avaliação é completamente inútil, tendo name um valor que não existe, e todos os values são "dado não coletado"...

* O campos de "outras" no "Outras características" usa 'material3' como _name_. Isso está errado.
