require 'rails_helper'

RSpec.describe 'User login', type: :feature do
  describe 'login' do
    before(:each) do
      visit new_user_session_path
    end

    let(:user) {FactoryBot.create(:user) }

    it 'Cuando los datos son correctos, entonces inicia sesión exitosamente' do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Iniciar'
      expect(page).to have_content 'Inició sesión'
    end

    it 'Cuando el email es incorrecto, entonces falla el inicio de sesión' do
      fill_in 'Email', with: 'error@email.com'
      fill_in 'Password', with: user.password
      click_button 'Iniciar'
      expect(page).to have_content 'Email o clave inválida'
    end

    it 'Cuando la clave es incorrecta, entonces falla el inicio de sesión' do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'clave_fallida'
      click_button 'Iniciar'
      expect(page).to have_content 'Email o clave inválida'
    end
  end
end
