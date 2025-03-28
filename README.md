
---

# **Over Share It (Flask + Static Frontend)** 

## **About the Project**  
This project is a **full-stack web application** for managing contacts. It consists of:  
- **Backend:** Flask API with SQLite database.  
- **Frontend:** Static HTML, CSS, and JavaScript.  
- **Deployment:** Hosted on **Render.com** with a strict CORS policy.  
- **CI/CD Pipeline:** GitHub Actions with automated **testing & deployment**.  

---

## **Tech Stack**  
| Component  | Technology Used |
|------------|----------------|
| **Backend** | Flask, SQLAlchemy, SQLite |
| **Frontend** | HTML, CSS, JavaScript (Fetch API) |
| **API Testing** | `curl`, `jq` |
| **CI/CD** | GitHub Actions, Render API |
| **Hosting** | Render.com |

---

## **Live Demo**
**[Try the Live App](https://over-share-it-frontend.onrender.com)**

---

## **Features**  
✅ **Contact Management**: Add, retrieve, and delete users.  
✅ **Secure API**: CORS-restricted API ensures only the frontend can interact with it.  
✅ **Automated Testing**: `smoke-test.sh` runs before deployment to verify API health.  
✅ **CI/CD Pipeline**: Deployment only happens if tests pass.  

---

## **Getting Started (Local Development)**  

### **Set Up the Backend**  

#### **️Clone the Repository**  
```sh
git clone https://github.com/skravco/over-share-it-api.git
cd over-share-it-api
```
Install dependencies:  
```sh
pip install -r requirements.txt
```
Run the Flask API:  
```sh
python app.py
```
Your API will be available at **`http://localhost:5000`**.

### **Set Up the Frontend**  

#### **️Clone the Repository**  
```sh
git clone https://github.com/skravco/over-share-it-frontend.git
cd over-share-it-frontend
```
Run a simple static server:  
```sh
python -m http.server 8000
```
Visit **`http://localhost:8000`** in your browser.

---

## **Running Smoke Tests**  
Before deployment, automated **smoke tests** check if the API is running correctly:  
```sh
chmod +x smoke-test.sh
./smoke-test.sh
```
If the test **fails**, the deployment **will not proceed**.

---

## **CI/CD & Deployment on Render**  
This project is **fully automated** using **GitHub Actions** and **Render.com**.

### **GitHub Actions Workflow**  
1. Runs **smoke tests** on every `git push`.  
2. If tests **pass**, it triggers **Render API** for deployment.  

### **Deploying to Render**  
1. **Fork this repo** and link it to **Render.com**.  
2. **Set up GitHub Secrets** for automatic deployment:  
   - `RENDER_API_KEY` → Your Render API Key.  
3. **Push changes to `master`** – The CI/CD pipeline will handle the rest.  

---

## **API Endpoints**  
| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/users` | Retrieve all users |
| `POST` | `/users` | Add a new user |
| `GET` | `/users/<id>` | Get a user by ID |
| `DELETE` | `/users/<id>` | Remove a user |

---

## **How I Built This (Why It's Valuable)**  
**Best Practices:** Secure CORS policies, modular Flask design.  
**Automated Testing:** Ensures code reliability before deployment.  
**CI/CD Pipeline:** Reduces deployment risks with GitHub Actions.  
**Cloud Deployment:** Easily scalable on Render.  
**Clean & Documented Code:** Easy for teams to maintain and scale.  

---

## **Contact Me**  
*If you're looking for a **skilled engineer** who knows **backend, security, testing, and CI/CD**, feel free to reach out:*  

 **Portfolio**: [skravco.github.io](https://skravco.github.io/)
 **LinkedIn**: [skravco](https://www.linkedin.com/in/skravco)

---