#!/usr/bin/env ruby

require 'logger'
require 'cocoapods-core'

logger = Logger.new(STDOUT)

@workspace = $BUDDYBUILD_WORKSPACE ||= "."
@podspec_path = "#{@workspace}/Dumbbell.podspec.json"

@podspec = Pod::Specification.from_file(@podspec_path)
@new_minor_version = @podspec.version.minor + 1

@new_version = Pod::Version.new("#{@podspec.version.major}.#{@new_minor_version}.#{@podspec.version.patch}")

logger.info("New podspec version is " + @new_version.to_s)

@podspec.version= @new_version
@podspec.source = {:git => @podspec.source[:git], :tag => @new_version.to_s}

File.open(@podspec_path, "w") { |file| file.puts @podspec.to_pretty_json }
logger.info("Podspec has been updated")
