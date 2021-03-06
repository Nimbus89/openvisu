class Project < ActiveRecord::Base

    belongs_to :user
    belongs_to :startpage, class_name: "Page"
    has_many :pages
    accepts_nested_attributes_for :pages
    has_many :data_sources
    has_many :mapping_functions
    has_many :comparison_functions
    has_many :combination_functions

    validates :name, :screensize_x, :screensize_y, presence: true
    validates :screensize_y, :screensize_x, numericality: { only_integer: true }
    validates :name, uniqueness: { scope: :user, message: "You already have a project with that name"}
end
