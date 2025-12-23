path = File.join(__dir__, 'nome_da_pasta', '*.rb')

Dir[path].each do |file|
  require file
end