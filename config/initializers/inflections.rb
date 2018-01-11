# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
ActiveSupport::Inflector.inflections(:en) do |inflect|
  # inflect.plural /^(ox)$/i, '\1en'
  # inflect.singular /^(ox)en/i, '\1'
  # inflect.irregular 'person', 'people'
  # inflect.uncountable %w( fish sheep )
  inflect.irregular 'anamnese', 'anamneses'
  inflect.irregular 'pqm', 'pqms'
  inflect.irregular 'avaliacao', 'avaliacoes'
  inflect.irregular 'curvatura_raizes', 'curvaturas_raizes'
  inflect.irregular 'esvaziamento_canais', 'esvaziamentos_canais'
  inflect.irregular 'obturacao', 'obturacoes'
  inflect.irregular 'preparo_terco_cervical', 'preparos_terco_cervical'
  inflect.irregular 'exame_raio_x', 'exames_raio_x'
  inflect.irregular 'semio_auxiliar', 'semio_auxiliares'
end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end
