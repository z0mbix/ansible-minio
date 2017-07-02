Vagrant.configure('2') do |config|
  if Vagrant.has_plugin?('vagrant-proxyconf')
    proxy = ENV['http_proxy']
    no_proxy = ENV['no_proxy']
    unless proxy.nil?
      puts "Using Proxy: %s" % proxy
      config.proxy.http     = "%s" % proxy
      config.proxy.https    = "%s" % proxy
      config.proxy.no_proxy = "%s" % no_proxy
    end
  end
end
