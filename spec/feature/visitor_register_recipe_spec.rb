require 'rails_helper'

feature 'Visitor register recipe' do
  scenario 'view send link' do
    visit root_path

    expect(page).to have_link('Home', href: root_path, class: 'nav-link')
    expect(page).to have_link('Enviar uma receita', href: new_recipe_path,
                                                    class: 'nav-link')
  end

  scenario 'successfully' do

    RecipeType.create(name: 'Entrada')

    # simula a ação do usuário
    visit root_path
    click_on 'Enviar uma receita'

    fill_in 'Título', with: 'Tabule'
    # fill_in 'Tipo da Receita', with: 'Entrada'
    select 'Entrada', from: 'Tipo da Receita'
    fill_in 'Cozinha', with: 'Arabe'
    fill_in 'Dificuldade', with: 'Fácil'
    fill_in 'Tempo de Preparo', with: '45'
    fill_in 'Ingredientes', with: 'Trigo para quibe, cebola, tomate picado, azeite, salsinha'
    fill_in 'Como Preparar', with: 'Misturar tudo e servir. Adicione limão a gosto.'
    click_on 'Enviar'


    # expectativas
    expect(page).to have_css('h1', text: 'Tabule')
    expect(page).to have_css('h3', text: 'Detalhes')
    expect(page).to have_css('p', text: 'Entrada')
    expect(page).to have_css('p', text: 'Arabe')
    expect(page).to have_css('p', text: 'Fácil')
    expect(page).to have_css('p', text: "45 minutos")
    expect(page).to have_css('h3', text: 'Ingredientes')
    expect(page).to have_css('p', text: 'Trigo para quibe, cebola, tomate picado, azeite, salsinha')
    expect(page).to have_css('h3', text: 'Como Preparar')
    expect(page).to have_css('p', text:  'Misturar tudo e servir. Adicione limão a gosto.')
  end
end
