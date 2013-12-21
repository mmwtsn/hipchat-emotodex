guard :rspec, cmd: 'rspec --color' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
  watch('app.rb')               { "spec" }
  watch('helpers.rb')           { "spec" }
end

guard 'livereload' do
  watch(%r{^spec/javascripts/.*/(.*)\.js})
  watch(%r{^spec/javascripts/(.*)\.js})
  watch(%r{^public/javascripts/.*/(.*)\.js})
  watch(%r{^public/javascripts/(.*)\.js})
end

guard :compass
