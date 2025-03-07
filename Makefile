test:
	@pytest -rA -vv python/*
	@julia -e 'using Test; for file in readdir("julia", join=true) include(file) end'

clean:
	rm -rf .pytest_cache python/__pycache__