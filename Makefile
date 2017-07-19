CARTHAGE=carthage
BREW=brew
SWIFTGEN=swiftgen
ROME=rome
SOURCERY=sourcery

update:
	$(CARTHAGE) update --no-use-binaries --platform ios

bootstrap: generate
	$(CARTHAGE) update --no-build --no-use-binaries --platform ios

dependencies:
	$(BREW) update
	$(BREW) install swiftgen 

generate:
	$(SWIFTGEN) storyboards -t swift3 -o Buddybuild/Generated/Storyboards.swift Buddybuild/Base.lproj/Main.storyboard

