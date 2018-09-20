require 'rails_helper'

feature 'user mark recipe as feature' do
  scenario 'successfully' do
    Recipe.create(title: 'Bolo de cenoura', difficulty: 'Médio',
                  recipe_type: 'Sobremesa', cuisine: 'Brasileira',
                  cook_time: 50, ingredients: 'Farinha, açucar, cenoura',
                  cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    visit root_path
    click_on 'Bolo de cenoura'
    click_on 'Editar'
    check 'Marcar como destaque'
    click_on 'Enviar'

    expect(page).to have_css("img[src*='star']")
  end

  scenario 'and they appear differently' do
    featured_recipe = Recipe.create(title: 'Bolo de cenoura',
                                    difficulty: 'Médio',
                                    recipe_type: 'Sobremesa',
                                    cuisine: 'Brasileira',
                                    cook_time: 50,
                                    ingredients: 'Farinha, açucar, cenoura',
                                    cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes',
                                    featured: true)

    another_recipe = Recipe.create(title: 'Feijoada',
                                   recipe_type: 'Prato Principal',
                                   cuisine: 'Brasileira', difficulty: 'Difícil',
                                   cook_time: 90,
                                   ingredients: 'Feijão e carnes',
                                   cook_method: 'Misture o feijão com as carnes',
                                   featured: false)
    visit root_path

    expect(page).to have_css('h3', text: 'Receitas destaque')
    within '#recipes-featured' do
      expect(page).to have_content(featured_recipe.title)
      expect(page).to have_css("img[src*='star']")
    end
    expect(page).to have_css('h3', text: 'Outras receitas')
    within '#other-recipes' do
      expect(page).to have_content(another_recipe.title)
    end
  end
end
