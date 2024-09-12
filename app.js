import express from 'express';
import cors from 'cors';
import propertyRoutes from './modules/property/property.routes.js';

const app = express();
const PORT = parseInt(process.env.PORT ?? 5000);

app.use(cors({ origin: true }));

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use('/api/properties', propertyRoutes);

app.listen(PORT, () => console.log(`Running on http://localhost:${PORT}`));
