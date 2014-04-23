syn match stSyntax "[\+\-\/\*]"

syn match stKeyword "\^"
syn match stKeyword ":="

syn match stMethod "\(\<\h\w*\>:\)"
"syn match stMethod "\(\<[a-z_][a-zA-Z0-9_]*\>:\)"

if exists("g:is_gst") || exists("is_gst")
	syn region stSyntax start="<." end=">" contains=stString,stKeyword fold containedin=stBlock

	syn keyword stNamespace Smalltalk BLOX BLOXBrowser
	syn keyword stNamespace CSymbols Kernel NetClients
	syn keyword stNamespace STInST STClassLoaderObjects
	syn keyword stNamespace SystemExceptions VFS Undeclared

	syn keyword stClass Autoload Object Behavior
	syn keyword stClass ClassDescription Class Metaclass
	syn keyword stClass BlockClosure Boolean False True
	syn keyword stClass CFunctionDescriptor CObject CAggregate
	syn keyword stClass CArray CPtr CString CCompound
	syn keyword stClass CStruct CUnion CScalar CChar CDouble
	syn keyword stClass CFloat CInt CLong CLongDouble CShort
	syn keyword stClass CSmalltalk CUChar CByte CBoolean
	syn keyword stClass CUInt CULong CUShort Collection
	syn keyword stClass Bag HashedCollection Dictionary
	syn keyword stClass BindingDictionary AbstractNamespace
	syn keyword stClass Namespace RootNamespace SystemDictionary
	syn keyword stClass LookupTable IdentityDictionary
	syn keyword stClass MethodDictionary WeakValueLookupTable
	syn keyword stClass WeakValueIdentityDictionary
	syn keyword stClass WeakKeyDictionary WeakKeyIdentityDictionary
	syn keyword stClass Set IdentitySet WeakSet WeakIdentitySet
	syn keyword stClass MappedCollection SequenceableCollection
	syn keyword stClass ArrayedCollection Array WeakAray ByteArray
	syn keyword stClass CharacterArray String Regex Symbol
	syn keyword stClass UnicodeString CompiledCode CompiledBlock
	syn keyword stClass CompiledMethod Interval LargeArrayedCollection
	syn keyword stClass LargeArray LargeByteArray LargeWordArray
	syn keyword stClass WordArray LinkedList Semaphore
	syn keyword stClass OrderedCollection RunArray SortedCollection
	syn keyword stClass ContextPart BlockContext MethodContext
	syn keyword stClass Continuation CType CPtrCType CArrayCType
	syn keyword stClass CScalarCType CStringCType Debugger
	syn keyword stClass Delay DLD DumperProxy AlternativeObjectProxy
	syn keyword stClass NullProxy VersionableObject PluggableProxy
	syn keyword stClass SingletonProxy
	syn keyword stClass File Directory FileSegment Getopt
	syn keyword stClass Link Process CallinProcess SymLink
	syn keyword stClass Magnitude Character UnicodeCharacter
	syn keyword stClass Date DateTime LookupKey Association
	syn keyword stClass HomedAssociation VariableBinding
	syn keyword stClass DeferredVariableBinding Number Float FloatD
	syn keyword stClass FloatE FloatQ Fraction Integer LargeInteger
	syn keyword stClass LargeNegativeInteger LargePositiveInteger
	syn keyword stClass LargeZeroInteger SmallInteger ScaledDecimal
	syn keyword stClass Time Duration Memory Message DirectedMessage
	syn keyword stClass MethodInfo ObjectMemory Package PackageLoader
	syn keyword stClass Permission Point ProcessorScheduler Rectangle
	syn keyword stClass RecursionLock RegexResults SecurityPolicy
	syn keyword stClass SharedQueue Signal Exception Error Halt
	syn keyword stClass ArithmeticError ZeroDivide MessageNotUnderstood
	syn keyword stClass Notification Warning Stream Generator ObjectDumper
	syn keyword stClass PositionableStream ReadStream WriteStream
	syn keyword stClass ReadWriteStream ByteStream FileDescriptor
	syn keyword stClass FileStream Random TextCollector ExceptionSet
	syn keyword stClass UndefinedObject ValueAdaptor NullValueHolder
	syn keyword stClass PluggableAdaptor DelayedAdaptor ValueHolder
	syn keyword stClass Promise

	" all instances who aren't also classes or namespaces
	syn keyword stInstance Transcript
endif

syn region stComment start="\"" end="\"" fold
syn region stBlock matchgroup=Delimiter start='\[' matchgroup=Delimiter end='\]' contains=ALLBUT,stBlockError fold transparent

hi def link stNamespace Type
hi def link stClass Type
hi def link stInstance Identifier
hi def link stMath Special
hi def link stSyntax Special
