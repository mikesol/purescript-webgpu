module Web.GPU.GPUBlendComponent where

import Web.GPU.GPUBlendFactor (GPUBlendFactor)
import Web.GPU.GPUBlendOperation (GPUBlendOperation)
import Web.GPU.Internal.RequiredAndOptional (RequiredAndOptional)

newtype GPUBlendComponent = GPUBlendComponent
  ( RequiredAndOptional ()
      ( operation :: GPUBlendOperation
      , srcFactor :: GPUBlendFactor
      , dstFactor :: GPUBlendFactor
      )
  )