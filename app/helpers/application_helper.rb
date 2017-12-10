module ApplicationHelper
  def current_user
    if session[:user_id]
      Usuario.find(session[:user_id])
    else
      nil
    end
  end

  def toggle(form_builder, field_1, label_1, field_2, label_2, method)
    string = <<-HTML
    <div class="form-group form-toggler">
      #{label_1}<br />

      <div class="form-check form-check-inline">
        <label class="form-check-label">
          #{form_builder.radio_button(field_1, 'sim', :class => 'form-check-input')} Sim
        </label>
      </div>

      <div class="form-check form-check-inline">
        <label class="form-check-label">
          #{form_builder.radio_button(field_1, 'não', :class => 'form-check-input')} Não
        </label>
      </div>

      <div class="form-check form-check-inline">
        <label class="form-check-label">
          #{form_builder.radio_button(field_1, 'dado não coletado', :class => 'form-check-input')} Dado não coletado
        </label>
      </div>
    </div>

    <div class="form-group form-hidden">
      #{form_builder.label field_2, label_2}
      #{form_builder.send(method, field_2, :class => 'form-control')}
    </div>
    HTML
    return string.html_safe
  end

  def toggle_text_area(form_builder, field_1, label_1, field_2, label_2)
    toggle(form_builder, field_1, label_1, field_2, label_2, 'text_area')
  end

  def toggle_text_field(form_builder, field_1, label_1, field_2, label_2)
    toggle(form_builder, field_1, label_1, field_2, label_2, 'text_field')
  end
end

def radios(form_builder, field, label)
    string = <<-HTML
    <div class="form-group">
      #{label}<br />

      <div class="form-check form-check-inline">
        <label class="form-check-label">
          #{form_builder.radio_button(field, 'sim', :class => 'form-check-input')} Sim
        </label>
      </div>

      <div class="form-check form-check-inline">
        <label class="form-check-label">
          #{form_builder.radio_button(field, 'não', :class => 'form-check-input')} Não
        </label>
      </div>

      <div class="form-check form-check-inline">
        <label class="form-check-label">
          #{form_builder.radio_button(field, 'dado não coletado', :class => 'form-check-input')} Dado não coletado
        </label>
      </div>
    </div>
    HTML
    return string.html_safe
end

  # .form-group.form-toggler
  #   | Usa medicamentos?<br />
  #   .form-check.form-check-inline
  #     label.form-check-label
  #       = f.radio_button('usa_medicamentos', 'sim', :class => 'form-check-input')
  #       ' Sim
  #   .form-check.form-check-inline
  #     label.form-check-label
  #       = f.radio_button('usa_medicamentos', 'não', :class => 'form-check-input')
  #       ' Não
  #   .form-check.form-check-inline
  #     label.form-check-label
  #       = f.radio_button('usa_medicamentos', 'dados não coletado', :class => 'form-check-input')
  #       ' Dado não coletado
  # .form-group.form-hidden
  #   = f.label :lista_de_medicamentos, 'Quais medicamentos estão em uso'
  #   = f.text_area :lista_de_medicamentos, :class => 'form-control'