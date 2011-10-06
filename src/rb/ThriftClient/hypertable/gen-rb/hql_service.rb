#
# Autogenerated by Thrift Compiler (0.7.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'
require 'client_service'
require 'hql_types'

        module Hypertable
          module ThriftGen
            module HqlService
              class Client < Hypertable::ThriftGen::ClientService::Client 
                include ::Thrift::Client

                def hql_exec(ns, command, noflush, unbuffered)
                  send_hql_exec(ns, command, noflush, unbuffered)
                  return recv_hql_exec()
                end

                def send_hql_exec(ns, command, noflush, unbuffered)
                  send_message('hql_exec', Hql_exec_args, :ns => ns, :command => command, :noflush => noflush, :unbuffered => unbuffered)
                end

                def recv_hql_exec()
                  result = receive_message(Hql_exec_result)
                  return result.success unless result.success.nil?
                  raise result.e unless result.e.nil?
                  raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'hql_exec failed: unknown result')
                end

                def hql_query(ns, command)
                  send_hql_query(ns, command)
                  return recv_hql_query()
                end

                def send_hql_query(ns, command)
                  send_message('hql_query', Hql_query_args, :ns => ns, :command => command)
                end

                def recv_hql_query()
                  result = receive_message(Hql_query_result)
                  return result.success unless result.success.nil?
                  raise result.e unless result.e.nil?
                  raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'hql_query failed: unknown result')
                end

                def hql_exec2(ns, command, noflush, unbuffered)
                  send_hql_exec2(ns, command, noflush, unbuffered)
                  return recv_hql_exec2()
                end

                def send_hql_exec2(ns, command, noflush, unbuffered)
                  send_message('hql_exec2', Hql_exec2_args, :ns => ns, :command => command, :noflush => noflush, :unbuffered => unbuffered)
                end

                def recv_hql_exec2()
                  result = receive_message(Hql_exec2_result)
                  return result.success unless result.success.nil?
                  raise result.e unless result.e.nil?
                  raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'hql_exec2 failed: unknown result')
                end

                def hql_query2(ns, command)
                  send_hql_query2(ns, command)
                  return recv_hql_query2()
                end

                def send_hql_query2(ns, command)
                  send_message('hql_query2', Hql_query2_args, :ns => ns, :command => command)
                end

                def recv_hql_query2()
                  result = receive_message(Hql_query2_result)
                  return result.success unless result.success.nil?
                  raise result.e unless result.e.nil?
                  raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'hql_query2 failed: unknown result')
                end

              end

              class Processor < Hypertable::ThriftGen::ClientService::Processor 
                include ::Thrift::Processor

                def process_hql_exec(seqid, iprot, oprot)
                  args = read_args(iprot, Hql_exec_args)
                  result = Hql_exec_result.new()
                  begin
                    result.success = @handler.hql_exec(args.ns, args.command, args.noflush, args.unbuffered)
                  rescue Hypertable::ThriftGen::ClientException => e
                    result.e = e
                  end
                  write_result(result, oprot, 'hql_exec', seqid)
                end

                def process_hql_query(seqid, iprot, oprot)
                  args = read_args(iprot, Hql_query_args)
                  result = Hql_query_result.new()
                  begin
                    result.success = @handler.hql_query(args.ns, args.command)
                  rescue Hypertable::ThriftGen::ClientException => e
                    result.e = e
                  end
                  write_result(result, oprot, 'hql_query', seqid)
                end

                def process_hql_exec2(seqid, iprot, oprot)
                  args = read_args(iprot, Hql_exec2_args)
                  result = Hql_exec2_result.new()
                  begin
                    result.success = @handler.hql_exec2(args.ns, args.command, args.noflush, args.unbuffered)
                  rescue Hypertable::ThriftGen::ClientException => e
                    result.e = e
                  end
                  write_result(result, oprot, 'hql_exec2', seqid)
                end

                def process_hql_query2(seqid, iprot, oprot)
                  args = read_args(iprot, Hql_query2_args)
                  result = Hql_query2_result.new()
                  begin
                    result.success = @handler.hql_query2(args.ns, args.command)
                  rescue Hypertable::ThriftGen::ClientException => e
                    result.e = e
                  end
                  write_result(result, oprot, 'hql_query2', seqid)
                end

              end

              # HELPER FUNCTIONS AND STRUCTURES

              class Hql_exec_args
                include ::Thrift::Struct, ::Thrift::Struct_Union
                NS = 1
                COMMAND = 2
                NOFLUSH = 3
                UNBUFFERED = 4

                FIELDS = {
                  NS => {:type => ::Thrift::Types::I64, :name => 'ns'},
                  COMMAND => {:type => ::Thrift::Types::STRING, :name => 'command'},
                  NOFLUSH => {:type => ::Thrift::Types::BOOL, :name => 'noflush', :default => false},
                  UNBUFFERED => {:type => ::Thrift::Types::BOOL, :name => 'unbuffered', :default => false}
                }

                def struct_fields; FIELDS; end

                def validate
                end

                ::Thrift::Struct.generate_accessors self
              end

              class Hql_exec_result
                include ::Thrift::Struct, ::Thrift::Struct_Union
                SUCCESS = 0
                E = 1

                FIELDS = {
                  SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => Hypertable::ThriftGen::HqlResult},
                  E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => Hypertable::ThriftGen::ClientException}
                }

                def struct_fields; FIELDS; end

                def validate
                end

                ::Thrift::Struct.generate_accessors self
              end

              class Hql_query_args
                include ::Thrift::Struct, ::Thrift::Struct_Union
                NS = 1
                COMMAND = 2

                FIELDS = {
                  NS => {:type => ::Thrift::Types::I64, :name => 'ns'},
                  COMMAND => {:type => ::Thrift::Types::STRING, :name => 'command'}
                }

                def struct_fields; FIELDS; end

                def validate
                end

                ::Thrift::Struct.generate_accessors self
              end

              class Hql_query_result
                include ::Thrift::Struct, ::Thrift::Struct_Union
                SUCCESS = 0
                E = 1

                FIELDS = {
                  SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => Hypertable::ThriftGen::HqlResult},
                  E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => Hypertable::ThriftGen::ClientException}
                }

                def struct_fields; FIELDS; end

                def validate
                end

                ::Thrift::Struct.generate_accessors self
              end

              class Hql_exec2_args
                include ::Thrift::Struct, ::Thrift::Struct_Union
                NS = 1
                COMMAND = 2
                NOFLUSH = 3
                UNBUFFERED = 4

                FIELDS = {
                  NS => {:type => ::Thrift::Types::I64, :name => 'ns'},
                  COMMAND => {:type => ::Thrift::Types::STRING, :name => 'command'},
                  NOFLUSH => {:type => ::Thrift::Types::BOOL, :name => 'noflush', :default => false},
                  UNBUFFERED => {:type => ::Thrift::Types::BOOL, :name => 'unbuffered', :default => false}
                }

                def struct_fields; FIELDS; end

                def validate
                end

                ::Thrift::Struct.generate_accessors self
              end

              class Hql_exec2_result
                include ::Thrift::Struct, ::Thrift::Struct_Union
                SUCCESS = 0
                E = 1

                FIELDS = {
                  SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => Hypertable::ThriftGen::HqlResult2},
                  E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => Hypertable::ThriftGen::ClientException}
                }

                def struct_fields; FIELDS; end

                def validate
                end

                ::Thrift::Struct.generate_accessors self
              end

              class Hql_query2_args
                include ::Thrift::Struct, ::Thrift::Struct_Union
                NS = 1
                COMMAND = 2

                FIELDS = {
                  NS => {:type => ::Thrift::Types::I64, :name => 'ns'},
                  COMMAND => {:type => ::Thrift::Types::STRING, :name => 'command'}
                }

                def struct_fields; FIELDS; end

                def validate
                end

                ::Thrift::Struct.generate_accessors self
              end

              class Hql_query2_result
                include ::Thrift::Struct, ::Thrift::Struct_Union
                SUCCESS = 0
                E = 1

                FIELDS = {
                  SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => Hypertable::ThriftGen::HqlResult2},
                  E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => Hypertable::ThriftGen::ClientException}
                }

                def struct_fields; FIELDS; end

                def validate
                end

                ::Thrift::Struct.generate_accessors self
              end

            end

          end
        end
