class Pacient < ApplicationRecord
  self.table_name = 'paciente'
  self.primary_key = 'id_paciente'

  alias_attribute :id, :id_paciente
  alias_attribute :name, :paciente_nome
  alias_attribute :sex, :paciente_sexo
  alias_attribute :birthday, :paciente_nascimento
  alias_attribute :address, :paciente_endereco
  alias_attribute :phone, :paciente_telefone
  alias_attribute :email, :paciente_email
  alias_attribute :rg, :paciente_rg
  alias_attribute :cpf, :paciente_cpf
  alias_attribute :companion, :paciente_acompanhante
  alias_attribute :registration_date, :paciente_datacadastro

end
