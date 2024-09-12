import { z } from 'zod';

export const newPropertySchema = z.object({
  address: z.string().min(1),
  price: z.number().positive(),
  surface: z.number().positive(),
  type: z.string().min(1),
  isAvailable: z.boolean(),
  description: z.string().min(1),
});

export const updatePropertySchema = newPropertySchema.merge(
  z.object({
    id: z.number().int(),
  }),
);
