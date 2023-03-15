require 'rails_helper'

RSpec.describe 'User registration', type: :feature do
  describe 'register' do
    before(:each) do
      visit new_user_registration_path
    end

    it 'Cuando los datos son correctos, entonces se registra exitosamente' do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '123456'
      click_button 'Guardar'
      expect(page).to have_content 'Bienvenido! Te registraste exitosamente.'
    end

    it 'Cuando la clave es menor a 6 caracteres, entonces falla el registro' do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: '12345'
      fill_in 'Password confirmation', with: '12345'
      click_button 'Guardar'
      expect(page).to have_content 'Password: Es demasiado corto (6 caracteres mínimo)'
    end

    it 'Cuando la confirmación de password no coincide, entonces falla el registro' do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: 'otra_clave'
      click_button 'Guardar'
      expect(page).to have_content 'Password confirmation: No coincide'
    end

    it 'Cuando email ya está en uso, entonces falla el registro' do
      first_user = FactoryBot.create(:user)
      fill_in 'Email', with: first_user.email
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '123456'
      click_button 'Guardar'
      expect(page).to have_content 'Email: Ya está en uso'
    end
  end
end
