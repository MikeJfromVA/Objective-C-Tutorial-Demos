MFILES_DIRECTORY = $(wildcard *.m)
EXECUTABLES = $(MFILES_BASIC:.m=)

# Special Cases

MFILES_BASIC := $(MFILES_DIRECTORY)
MFILES_BASIC := $(filter-out NewObjCFeatures.m,$(MFILES_BASIC))
MFILES_BASIC := $(filter-out foundation.m,$(MFILES_BASIC))
MFILES_BASIC := $(filter-out introspectionSelector.m,$(MFILES_BASIC))
MFILES_BASIC := $(filter-out metachase.m,$(MFILES_BASIC))
MFILES_BASIC := $(filter-out mikeash.m,$(MFILES_BASIC))

OTHERS += NewObjCFeatures foundation introspectionSelector metachase mikeash

all: $(EXECUTABLES) $(OTHERS)

NewObjCFeatures: NewObjCFeatures.m
	$(CC) -g -o $@ $< -framework Foundation

foundation: foundation.m
	$(CC) -g -o $@ $< -framework Foundation

introspectionSelector: introspectionSelector.m
	$(CC) -g -o $@ $< -framework Foundation

metachase: metachase.m
	$(CC) -g -o $@ $< -framework Foundation

mikeash: mikeash.m
	$(CC) -g -o $@ $< -framework Foundation

# Normal cases

$(EXECUTABLES): %: %.m
	$(CC) -g -o $@ $< -framework Foundation -fobjc-arc

.PHONY: clean
clean:
	rm -f $(EXECUTABLES) $(OTHERS)

makedebug:
	# MFILES_DIRECTORY $(MFILES_DIRECTORY)
	# MFILES_BASIC $(MFILES_BASIC)
	# EXECUTABLES $(EXECUTABLES)
	# OTHERS $(OTHERS)
