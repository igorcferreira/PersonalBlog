task "assets:precompile" do
  exec("bundle exec jekyll build")
end

task :launch do
  exec("bundle exec jekyll serve")
end

task :default => "assets:precompile"