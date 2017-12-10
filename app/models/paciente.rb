class Paciente < ApplicationRecord
  self.table_name = 'paciente'
  self.primary_key = 'id_paciente'

  alias_attribute :id, :id_paciente
  alias_attribute :nome, :paciente_nome
  alias_attribute :sexo, :paciente_sexo
  alias_attribute :nascimento, :paciente_nascimento
  alias_attribute :endereco, :paciente_endereco
  alias_attribute :telefone, :paciente_telefone
  alias_attribute :email, :paciente_email
  alias_attribute :rg, :paciente_rg
  alias_attribute :cpf, :paciente_cpf
  alias_attribute :acompanhante, :paciente_acompanhante
  alias_attribute :data_cadastro, :paciente_datacadastro

  has_many :anamneses, :foreign_key => 'id_paciente', :class_name => 'Anamnese'
  has_many :avaliacoes, :foreign_key => 'id_paciente', :class_name => 'Avaliacao'
  has_many :tratamentos, :foreign_key => 'id_paciente', :class_name => 'Tratamento'
  has_many :controles, :foreign_key => 'id_paciente', :class_name => 'Controle'


  before_create :define_creation_time

  def self.search_by_name(name)
    where('paciente_nome LIKE ?', "%#{name}%")
  end

  private

  def define_creation_time
    self.data_cadastro = Time.now
  end
end
