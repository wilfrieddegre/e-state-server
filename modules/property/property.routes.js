import { Router } from 'express';
import * as c from './property.controllers.js';

const router = Router();

router.route('/').get(c.getProperties).post(c.addNewProperty);
router.route('/:id').get(c.getProperty);

export default router;
