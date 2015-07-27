$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'lingva-latina'
require 'web'

Thread.new do
  begin
    LingvaLatina::App.instance.run
  rescue Exception => e
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end

run LingvaLatina::Web