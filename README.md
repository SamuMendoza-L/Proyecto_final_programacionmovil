# FlowCash

> Controla tu dinero diario sin hacer cuentas mentales.

FlowCash es una aplicación móvil enfocada en personas que reciben ingresos diarios (por ejemplo, meseros, vendedores, repartidores o trabajadores independientes) y necesitan saber cuánto pueden gastar, cuánto deben separar para sus obligaciones y cuánto llevan ahorrado, todo desde un dashboard simple y visual.

---

## Integrantes

| Nombre | Rol |
|---------|-----|
| Samuel Mendoza | Product Owner / Desarrollo |

> Agrega aquí los demás integrantes si el proyecto es grupal.

---

## Tecnologías

- Next.js 15
- React
- TypeScript
- Tailwind CSS
- Supabase (PostgreSQL + Auth)
- Vercel

---

## Cómo ejecutar el proyecto

### 1. Clonar el repositorio

```bash
git clone https://github.com/usuario/flowcash.git
cd flowcash
```

### 2. Instalar dependencias

```bash
npm install
```

### 3. Configurar variables de entorno

Crear un archivo `.env.local` con las credenciales de Supabase.

```env
NEXT_PUBLIC_SUPABASE_URL=tu_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=tu_key
```

### 4. Ejecutar en desarrollo

```bash
npm run dev
```

Abrir:

```
http://localhost:3000
```

---

## Estructura del proyecto

```text
flowcash/
├── app/
├── components/
├── lib/
├── docs/
│   └── definicion.md
├── public/
│   └── screenshots/
└── README.md
```

---

## Capturas del proyecto

> Las imágenes se agregarán conforme avance el desarrollo.

### Pantalla de inicio

![Inicio](public/screenshots/home.png)

### Dashboard

![Dashboard](public/screenshots/dashboard.png)

### Agregar ingreso

![Ingreso](public/screenshots/add-income.png)

### Deudas

![Deudas](public/screenshots/debts.png)

---

## Documentación

La documentación principal del proyecto se encuentra en:

**📄 [docs/definicion.md](docs/definicion.md)**

Este documento contiene:

- Definición del problema.
- Objetivos.
- Público objetivo.
- Alcance del MVP.
- Funcionalidades.
- Requisitos.
- Arquitectura inicial.

---

## Estado del proyecto

🚧 En desarrollo (MVP).

Actualmente se encuentran definidos:

- Diseño del producto.
- Arquitectura técnica.
- Modelo de datos.
- Sistema de diseño.
- Flujo de pantallas.