task :build_webpack do
  cd "frontend" do
    sh "npm install"
    sh "npm run build"
  end
end

Rake::Task["assets:precompile"].enhance(%i(build_webpack))
