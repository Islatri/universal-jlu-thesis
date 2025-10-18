# Justfile for universal-jlu-thesis

# Get version from typst.toml
version := `grep '^version' typst.toml | head -1 | sed 's/.*"\([^"]*\)".*/\1/'`
pkg_name := "universal-jlu-thesis"

# Default recipe
@default:
    just --list

# Build documentation (placeholder)
@doc:
    echo "Documentation already in docs/ folder"

# Package the template for release
@package out:
    echo "Packaging {{pkg_name}} v{{version}}..."
    mkdir -p {{out}}/{{pkg_name}}/{{version}}
    cp -r template/* {{out}}/{{pkg_name}}/{{version}}/
    cp typst.toml {{out}}/{{pkg_name}}/{{version}}/
    cp LICENSE {{out}}/{{pkg_name}}/{{version}}/
    cp README.md {{out}}/{{pkg_name}}/{{version}}/
    echo "Package ready at {{out}}/{{pkg_name}}/{{version}}"
