require 'sinatra'
require 'json'
require 'ansible'

get '/' do
  "Hello world"
end

post '/payload' do
  # Получаем json от github webhook
  #push = JSON.parse(request.body.read)
  # Выводим json
  #puts "I got some JSON: #{push.inspect}"

  # Задаем файл инвентаризации и путь к плэйбуку
  #inventory = Ansible::Inventory::FilePathInventory.new('./hosts')
  playbook_path = '/home/danila/compose_ansile/ansible_deploy.yml'
  result = system("ansible-playbook #{playbook_path}")
  # Переменные для ансибл при необходимости
  #playbook.exta_vars = { 'var1' => 'value1', '' => '' }
  #
  #
  #Run ansible 
  
  # Возвращаем результаты Ansible в качестве ответа на запрос
  { success: result }.to_json
end
