Pod::Spec.new do |s|
  s.name         = "Dumbbell"
  s.version      = "0.0.1"
  s.summary      = "Swift API Client for the Buddybuild API using Swift 4"

  s.description  = <<-HEREDOC
  Dumbbell is a Swift 4 wrapper for the Buddybuild REST API. This was made during
  WWDC after they announced the new Foundation API to decode JSON.
  It doesn't do much for now
HEREDOC

  s.homepage     = "https://github.com/BuddyBuild/Dumbbell"

  s.license      = "MIT"
  s.author             = { "Romain Pouclet" => "romain@buddybuild.com" }
  s.source       = { :git => "https://github.com/BuddyBuild/Dumbbell.git", :tag => s.version }
  s.source_files  = "Dumbbell/*.swift"
  s.platform = :ios, '8.0'
end

