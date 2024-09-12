import { db } from '../../lib/db.js';

export const createProperty = async (property) => {
  return await db.property.create({
    data: property,
  });
};

export const getProperties = async (options) => {
  return await db.property.findMany({
    include: {
      medias: options?.medias,
      progress: options?.progress,
    },
  });
};

export const getById = async (id, options) => {
  return await db.property.findUnique({
    where: {
      id,
    },
    include: {
      medias: options?.medias,
      progress: options?.progress,
    },
  });
};
