import * as repo from './property.repository.js';
import { newPropertySchema } from './property.schema.js';

export async function addNewProperty(req, res) {
  try {
    const result = newPropertySchema.safeParse(req.body);

    if (!result.success) {
      return res.status(400).json({ error: result.error });
    }

    const newProperty = await repo.createProperty(result.data);
    res.status(201).json({ data: newProperty });
  } catch (err) {
    res.status(500).json({ error: 'Error creating property' });
  }
}

export async function getProperties(req, res) {
  try {
    const properties = await repo.getProperties({
      medias: req.query.medias === '1',
      progress: req.query.progress === '1',
    });
    res.status(200).json({ data: properties });
  } catch (err) {
    res.status(500).json({ error: 'Error fetching properties' });
  }
}

export async function getProperty(req, res) {
  try {
    const property = await repo.getById(+req.params.id, {
      medias: req.query.medias === '1',
      progress: req.query.progress === '1',
    });
    if (!property) {
      return res.status(404).json({ error: 'Property not found' });
    }
    res.status(200).json({ data: property });
  } catch (err) {
    res.status(500).json({ error: 'Error fetching property' });
  }
}

export async function updateProperty(req, res) {}

export async function deleteProperty(req, res) {}
