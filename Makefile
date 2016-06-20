MFILES_IN_DIR = $(wildcard *.m)
HFILES_IN_DIR = $(wildcard *.h)
EXECUTABLES = $(MFILES_BASIC:.m=)
EXECUTABLES_WITH_HEADERS = $(HFILES_IN_DIR:.h=)

# Special Cases

MFILES_BASIC := $(MFILES_IN_DIR)
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

$(EXECUTABLES_WITH_HEADERS): %: %.h

$(EXECUTABLES): %: %.m
	$(CC) -g -o $@ $< -framework Foundation -fobjc-arc

.PHONY: clean
clean:
	rm -f $(EXECUTABLES) $(OTHERS)

makedebug:
	# MFILES_IN_DIR $(MFILES_IN_DIR)
	# HFILES_IN_DIR $(HFILES_IN_DIR)
	# MFILES_BASIC $(MFILES_BASIC)
	# EXECUTABLES $(EXECUTABLES)
	# EXECUTABLES_WITH_HEADERS $(EXECUTABLES_WITH_HEADERS)
	# OTHERS $(OTHERS)
