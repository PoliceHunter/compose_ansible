require 'sinatra'
require 'json'
require 'ansible'

post '/payload' do
  # Получаем json от github webhook
  push = JSON.parse(request.body.read)
  # Выводим json
  puts "I got some JSON: #{push.inspect}"

  # Задаем файл инвентаризации и путь к плэйбуку
  inventory = Ansible::Inventory::FilePathInventory.new('./hosts')
  playbook = Ansible::Playbook::Play.new('./ansible_deploy.yml', inventory)
  
  # Переменные для ансибл при необходимости
  #playbook.exta_vars = { 'var1' => 'value1', '' => '' }
  #
  #
  #Run ansible 
  result = playbook.run
  puts result.to_json

  # Возвращаем результаты Ansible в качестве ответа на запрос
  result.to_json
end
