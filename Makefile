EJABBERD_EBIN_DIR = /usr/lib/ejabberd/ebin/

.PHONY = all install-rails install-ejabberd clean

all: gen-erl/blogcastr_types.beam gen-erl/blogcastr_thrift.beam gen-rb/blogcastr_constants.rb  gen-rb/blogcastr.rb  gen-rb/blogcastr_types.rb

gen-erl/blogcastr_types.beam gen-erl/blogcastr_thrift.beam: gen-erl/blogcastr_constants.hrl gen-erl/blogcastr_thrift.erl gen-erl/blogcastr_types.hrl gen-erl/blogcastr_thrift.hrl gen-erl/blogcastr_types.erl
	erlc -o gen-erl gen-erl/blogcastr_thrift.erl
	erlc -o gen-erl gen-erl/blogcastr_types.erl

gen-erl/blogcastr_constants.hrl gen-erl/blogcastr_thrift.erl gen-erl/blogcastr_types.hrl gen-erl/blogcastr_thrift.hrl gen-erl/blogcastr_types.erl: blogcastr.thrift
	thrift --gen erl blogcastr.thrift

gen-rb/blogcastr_constants.rb  gen-rb/blogcastr.rb  gen-rb/blogcastr_types.rb: blogcastr.thrift
	thrift --gen rb blogcastr.thrift

install-rails: gen-rb/blogcastr_constants.rb  gen-rb/blogcastr.rb  gen-rb/blogcastr_types.rb
	cp gen-rb/* ../rails/lib/

install-ejabberd: gen-erl/blogcastr_types.beam gen-erl/blogcastr_thrift.beam
	sudo cp gen-erl/blogcastr_thrift.beam ${EJABBERD_EBIN_DIR}/
	sudo cp gen-erl/blogcastr_types.beam ${EJABBERD_EBIN_DIR}/

clean: 
	rm -rf gen-erl
	rm -rf gen-rb 
