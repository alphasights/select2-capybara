class MyApp
  def call(env)
    [200, { 'Content-Type'  => 'text/html' },
    File.open('./spec/app/minimum-input.html', File::RDONLY)]
  end
end