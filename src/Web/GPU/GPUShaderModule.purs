-- @inline export compilationInfo arity=1
module Web.GPU.GPUShaderModule
  ( GPUShaderModule
  , compilationInfo
  , GPUCompilationMessageType
  , error
  , warning
  , info
  ) where

import Prelude

import Effect (Effect)
import Web.GPU.Internal.Types (UnsignedLongLong)
import Web.Promise (Promise)

data GPUShaderModule
newtype GPUCompilationMessageType = GPUCompilationMessageType String

derive instance Eq GPUCompilationMessageType
derive instance Ord GPUCompilationMessageType
derive newtype instance Show GPUCompilationMessageType

error :: GPUCompilationMessageType
error = GPUCompilationMessageType "error"

warning :: GPUCompilationMessageType
warning = GPUCompilationMessageType "warning"

info :: GPUCompilationMessageType
info = GPUCompilationMessageType "info"

type GPUCompilationMessage =
  { message :: String
  , type :: GPUCompilationMessageType
  , lineNum :: UnsignedLongLong
  , linePos :: UnsignedLongLong
  , offset :: UnsignedLongLong
  , length :: UnsignedLongLong
  }

type GPUCompilationInfo =
  { messages :: Array GPUCompilationMessage
  }

foreign import compilationInfoImpl
  :: GPUShaderModule -> Effect (Promise GPUCompilationInfo)

compilationInfo :: GPUShaderModule -> Effect (Promise GPUCompilationInfo)
compilationInfo = compilationInfoImpl