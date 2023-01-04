module Web.GPU.GPUComputePassTimestampWrite where

import Data.Newtype (class Newtype)
import Web.GPU.GPUComputePassTimestampLocation (GPUComputePassTimestampLocation)
import Web.GPU.Internal.RequiredAndOptional (RequiredAndOptional)
import Web.GPU.Internal.Types (GPUQuerySet, GPUSize32)

newtype GPUComputePassTimestampWrite = GPUComputePassTimestampWrite
  ( RequiredAndOptional
      ( querySet :: GPUQuerySet
      , queryIndex :: GPUSize32
      , location :: GPUComputePassTimestampLocation
      )
      ()
  )

derive instance Newtype GPUComputePassTimestampWrite _