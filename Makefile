SPECDIR=specs/tla/modules
CFGDIR=specs/tla/configs

.PHONY: tlc tlc-all tlaps configs

tlc:
	./scripts/run_tlc.sh $(SPECDIR)/Alpenglow.tla $(CFGDIR)/Alpenglow.cfg

tlc-all: configs
	for N in 4 6 8 10; do ./scripts/run_tlc.sh $(SPECDIR)/Alpenglow.tla $(CFGDIR)/Alpenglow_$${N}.cfg; done

tlaps:
	./scripts/run_tlaps.sh $(SPECDIR)/Alpenglow.tla

configs:
	./scripts/gen_configs.sh


